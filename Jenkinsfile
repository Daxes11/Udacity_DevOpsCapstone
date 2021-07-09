pipeline {
    agent any
    
    stages {
        stage('Install app requirements') {
            steps {
                sh '''
                      cd flaskex_app
                      pip install --upgrade pip && pip install -r requirements.txt
                   '''

            }
        }
        stage('Linting App.py / Dockerfile') {
            steps {
                sh '''
                      cd flaskex_app
                      pylint --disable=R,C app.py
                   '''
                sh '''   
                      cd ..
                      wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
                      chmod +x ./hadolint
                      ./hadolint Dockerfile
                   '''

            }
        }
        stage('Build Docker image') {
            steps {              
                sh 'docker build -t udacity_capstone .'
            }
        }
        stage('Push Docker image to ECR') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 586771751035.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker tag udacity_capstone 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:$BRANCH_NAME'
                sh 'docker push 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:$BRANCH_NAME'
            }
        }
        stage('Post Build') {
            steps {
                sh 'docker run -p 80:5000 -d 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:$BRANCH_NAME'
            }
        }
    }
}
