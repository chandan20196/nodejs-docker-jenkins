pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerhub-creds'
        IMAGE_NAME = 'montisa/chandan-nodejs-demo1212'
        PORT = '3000'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/<your-username>/<your-nodejs-repo>.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t node-app .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh "docker tag node-app ${IMAGE_NAME}:latest"
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_HUB_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker stop node-app || true'
                sh 'docker rm node-app || true'
                sh "docker run -d -p ${PORT}:${PORT} --name node-app ${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed. Check logs!' }
    }
}
