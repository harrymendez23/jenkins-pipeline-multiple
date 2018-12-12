pipeline { 
    agent any 
    environment {
        SFDX = tool name: 'sfdx', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool '
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'in stage 1'
            }
        }
        stage('Create Scratch Org') {
            steps {
                sh '${SFDX}/sfdx --version'
            }
        }
    }
}