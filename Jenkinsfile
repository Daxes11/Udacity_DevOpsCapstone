pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'eksctl version'
                sh 'CreateEKSCluster.sh'
            }
        }
    }
}
