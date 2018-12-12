pipeline { 
    agent any 
    environment {
        HUB_ORG = '${env.HUB_ORG_DH}'
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