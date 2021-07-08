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
                      cd ..
                      ./hadolint Dockerfile
                   '''

            }
        }
        stage('Build Docker image') {
            steps {              
                sh 'docker build -t udacity_capstone .'
                sh 'echo "ssss $BRANCH_NAME"'
            }
        }
        stage('Push Docker image to ECR') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 586771751035.dkr.ecr.us-east-1.amazonaws.com'
                sh 'export image="udacity_capstone:latest 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:$BRANCH_NAME"'
                sh 'docker tag $image'
                sh 'docker push 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:latest'
            }
        }
        stage('Post Build') {
            steps {
                sh 'docker run -p 80:5000 -d 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone: + env.BRANCH_NAME'
            }
        }
    }
}
