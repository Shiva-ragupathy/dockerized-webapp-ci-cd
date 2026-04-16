pipeline {
    agent any

    environment {
        DOCKER_USER = "shivark1996"
        DOCKER_CREDS = "dockerhub-creds"
        IMAGE_NAME = "devops-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                script {
                    IMAGE_TAG = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
                    sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: DOCKER_CREDS,
                    usernameVariable: 'USERNAME',
                    passwordVariable: 'PASSWORD'
                )]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                }
            }
        }

        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh """
                docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKER_USER/dev:$IMAGE_TAG
                docker push $DOCKER_USER/dev:$IMAGE_TAG
                """
            }
        }

        stage('Push to Prod') {
            when {
                branch 'main'   // change to 'master' if needed
            }
            steps {
                sh """
                docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKER_USER/prod:$IMAGE_TAG
                docker push $DOCKER_USER/prod:$IMAGE_TAG
                """
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
