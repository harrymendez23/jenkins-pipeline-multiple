pipeline { 
    agent any 
    environment {
        SFDC_HOST = 'https://login.salesforce.com'
        HUB_ORG = 'harry.mendez.devhub@gmail.com'
        JWT_KEY_CRED_ID = credentials('jenkins-sfdx-private-key')
        CONNECTED_APP_CONSUMER_KEY = '3MVG9KsVczVNcM8y39KwEqVDCbn2tWnKY6xyhAEBj4_qNArd1nXL1L1Io08XYotwNz5CWk8GYP1JbCzs_zgJS'
        SCRATCH_ORG_ALIAS = 'JenkinsPipelineMultipleBuild'
        RUN_ARTIFACT_DIR="tests"

        SFDX = tool name: 'sfdx', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
    }
    stages {
        stage('Initialize Scratch Org') {
            options {
                timeout(time: 5, unit: 'MINUTES')
            }
            stages {
                stage('Authenticate to DevHub') {
                    steps {
                        sh returnStatus: true, script: "${SFDX}/sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${JWT_KEY_CRED_ID} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
                    }
                }
                stage('Create Scratch Org') {
                    steps {
                        sh returnStdout: true, script: "${SFDX}/sfdx force:org:create --definitionfile config/project-scratch-def.json --json --setdefaultusername --setalias ${SCRATCH_ORG_ALIAS}"
                    }
                }
            }
        }
        stage('Push Source to Test Org') {
            options {
                timeout(time: 2, unit: 'MINUTES')
            }
            steps {
                sh "${SFDX}/sfdx force:source:push --targetusername ${SCRATCH_ORG_ALIAS}"
            }
        }
        stage('Run Apex Test') {
            options {
                timeout(time: 5, unit: 'MINUTES')
            }
            steps {
                sh "mkdir -p ${RUN_ARTIFACT_DIR}"

                script {
                    rc = sh returnStatus: true, script: "${SFDX}/sfdx force:apex:test:run --testlevel RunLocalTests --outputdir ${RUN_ARTIFACT_DIR} --resultformat tap --targetusername ${SCRATCH_ORG_ALIAS}"
                    try {
                        if (rc != 0) {
                            error 'Apex test run failed'
                        }
                    }
                    catch(exc) {
                        currentBuild.result = 'FAILURE'
                        throw exc.message
                    }
                    finally {
                        stage('Collect Test Results') {
                            junit keepLongStdio: true, testResults: 'tests/**/*-junit.xml'
                        }

                        stage('Delete Scratch Org') {
                            sh returnStdout: true, script: "${sfdx}/sfdx force:org:delete --noprompt --targetusername ${SCRATCH_ORG_ALIAS}"
                        }
                    } 
                }
            }
        }
        stage('Production Deployment') {
            options {
                timeout(time: 15, unit: 'MINUTES')
            }
            when {
                branch 'production-deployment'
            }
            steps {
                sh "sfdx force:mdapi:deploy --testlevel RunLocalTests --targetusername ${HUB_ORG} --deploydir mdapi-output --wait 15"
            }
        }
    }
}