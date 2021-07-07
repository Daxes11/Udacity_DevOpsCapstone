pipeline {
    agent any
    
    stages {
        stage('Linting') {
            steps {
                sh 'echo Linting'
            }
        }
        stage('Build image') {
            steps {
                sh 'eksctl version'
                sh 'aws --version'
                sh 'docker version'
                sh 'aws ec2 describe-security-groups'
                sh 'aws s3 ls'
            }
        }
        stage('Push image') {
            steps {
                sh 'echo Linting'
            }
        }
    }
}
