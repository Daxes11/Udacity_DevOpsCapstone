pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'eksctl version'
                sh 'aws version'
                sh 'kubectl version'
                sh './CreateEKSCluster.sh'
            }
        }
    }
}
