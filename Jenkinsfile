ENVIRONMENTS = ['stag', 'prod']

pipeline {
    agent any

    tools {
      maven 'Maven'
    }
    
    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'Select branch to checkout')
        choice(name: 'ENVIRONMENT', choices: ENVIRONMENTS, description: 'Select environment to deploy the changes')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'mvn compile'
            }
        }
        stage('Test') {
            when {
                expression {
                    params.executeTests
                    sh 'mvn test'
                }
            }
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'mvn deploy'
            }
        }
    }
    post {
        success {
                echo 'SUCCESS!!!'
        }
        failure {
                echo 'FAILED!!!'
                echo "Something is wrong with ${env.BUILD_URL}"
        }
    }
}
