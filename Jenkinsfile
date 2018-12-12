pipeline { 
    agent any
    tools {
        CustomTool 'sfdx'
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'in stage 1'
            }
        }
        stage('Create Scratch Org') {
            steps {
                sh 'sfdx --version'
            }
        }
    }
}