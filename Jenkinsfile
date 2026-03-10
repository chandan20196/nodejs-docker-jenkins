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
                sh 'docker build -t montisa/chandan-nodejs-demo1212:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push montisa/chandan-nodejs-demo1212:latest'
            }
        }

    }
}
