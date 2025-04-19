pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'shubhnimdocker'
        IMAGE_NAME = 'app'
        DEV_TAG = 'dev:v1'
        PROD_TAG = 'prod:v1'
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds'
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
sh 'git submodule update --init --recursive'            
}
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKERHUB_USER}/${IMAGE_NAME}-${DEV_TAG} ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        if (env.BRANCH_NAME == 'dev') {
                            sh "docker tag ${DOCKERHUB_USER}/${IMAGE_NAME}:${DEV_TAG} ${DOCKERHUB_USER}/dev:v1"
                            sh "docker push ${DOCKERHUB_USER}/dev:v1"
                        } else if (env.BRANCH_NAME == 'master') {
                            sh "docker tag ${DOCKERHUB_USER}/${IMAGE_NAME}:${DEV_TAG} ${DOCKERHUB_USER}/prod:v1"
                            sh "docker push ${DOCKERHUB_USER}/prod:v1"
                        }
                    }
                }
            }
        }
    }
}

