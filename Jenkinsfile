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
            }
        }
        stage('Push Docker image to ECR') {
            steps {
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 586771751035.dkr.ecr.us-east-1.amazonaws.com'
                sh 'docker tag udacity_capstone 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:$BRANCH_NAME'
                sh 'docker push 586771751035.dkr.ecr.us-east-1.amazonaws.com/udacity_capstone:$BRANCH_NAME'
            }
        }
        stage('Connect to kubernetes cluster') {
            steps {
                sh 'aws eks --region us-east-1 update-kubeconfig --name CapstoneEKSCluster'
            }
        }
        stage('Deploy green container') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment-green.yml'
                //when { branch 'green'}
            }
        }
        stage('Redirect service to green container') {
            steps {
                sh 'kubectl apply -f kubernetes/loadbalancer-green.yml'
                //when { branch 'green'}
            }
        }
        stage('Deploy blue container') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment-blue.yml'
                when { branch 'blue'}
            }
        }
        stage('Redirect service to blue container') {
            steps {
                sh 'kubectl apply -f kubernetes/loadbalancer-blue.yml'
                when { branch 'blue'}
            }
        }
    }
}
