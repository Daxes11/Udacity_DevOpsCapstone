pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'eksctl version'
                sh 'aws --version'
                sh 'docker version'
                sh 'aws ec2 describe-security-groups'
                sh 'aws s3 ls'
            }
        }
    }
}
