pipeline { 
    agent any
    tools {
        com.cloudbees.jenkins.plugins.customtools.CustomTool name: 'sfdx'
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'in stage 1'
            }
        }
        stage('Create Scratch Org') {
            steps {
                sh "sfdx --version"
            }
        }
    }
}