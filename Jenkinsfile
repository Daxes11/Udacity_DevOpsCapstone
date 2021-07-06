@Library('github.com/releaseworks/jenkinslib') _

pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'eksctl version'
                sh 'aws --version'
                sh 'docker version'
                sh 'kubectl get nodes'
                }
            }
        }
    }
}
