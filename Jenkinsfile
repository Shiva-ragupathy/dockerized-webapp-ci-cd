pipeline {
    agent any

    environment {
        DOCKER_USER = "shivark1996"
    }

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t devops-app .'
            }
        }

        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh '''
                docker tag devops-app $DOCKER_USER/dev:latest
                docker push $DOCKER_USER/dev:latest
                '''
            }
        }

        stage('Push to Prod') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                docker tag devops-app $DOCKER_USER/prod:latest
                docker push $DOCKER_USER/prod:latest
                '''
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh './deploy.sh'
            }
        }
    }
}
