pipeline { 
    agent any 
    environment {
        SFDC_HOST = 'https://login.salesforce.com'
        HUB_ORG = 'harry.mendez.devhub@gmail.com'
        JWT_KEY_CRED_ID = credentials('jenkins-sfdx-private-key')
        CONNECTED_APP_CONSUMER_KEY = '3MVG9KsVczVNcM8y39KwEqVDCbn2tWnKY6xyhAEBj4_qNArd1nXL1L1Io08XYotwNz5CWk8GYP1JbCzs_zgJS'

        SFDX = tool name: 'sfdx', tysfdx force:auth:jwt:grantpe: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'in stage 1 HUB: ${HUB_ORG}'
            }
        }
        stage('Create Scratch Org') {
            options {
                timeout(time: 30, unit: 'SECONDS')
            }
            stages {
                stage('Authenticate to DevHub') {
                    steps {
                        sh returnStatus: true, script: "${SFDX}/sfdx force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${JWT_KEY_CRED_ID} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
                    }
                }
                stage('Create Scratch Org')  {
                    steps {
                
                    }
                }
            }
        }
    }
}