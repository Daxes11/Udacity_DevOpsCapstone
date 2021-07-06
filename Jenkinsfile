pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'eksctl version'
                sh 'aws --version'
                sh 'docker version'
                sh 'aws configure AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY'
                sh 'aws ec2 describe-security-groups'
            }
        }
    }
}
