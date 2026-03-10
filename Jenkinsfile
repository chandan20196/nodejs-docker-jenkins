pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/chandan20196/nodejs-docker-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chandan20196/nodejs-app .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push chandan20196/nodejs-app'
            }
        }

    }
}
