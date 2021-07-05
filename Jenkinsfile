pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'eksctl version'
                sh 'aws --version'
                sh 'docker version'
                sh './CreateEKSCluster.sh'
            }
        }
    }
}
