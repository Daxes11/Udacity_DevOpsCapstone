pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh '/usr/bin/python3 --version'
                sh 'eksctl version'
            }
        }
    }
}
