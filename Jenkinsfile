pipeline { 
    agent any 
    environment {
        SFDC_HOST = 'https://login.salesforce.com'
        HUB_ORG = 'harry.mendez.devhub@gmail.com'
        JWT_KEY_CRED_ID = credentials('jenkins-sfdx-private-key')

        SFDX = tool name: 'sfdx', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'in stage 1 HUB: ${HUB_ORG}'
            }
        }
        stage('Create Scratch Org') {
            steps {
                sh '${SFDX}/sfdx --version'
            }
        }
    }
}