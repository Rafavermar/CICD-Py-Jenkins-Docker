pipeline {
    agent any
    environment {
        registry = "jrvm/jenkins-simulador-dados"
        registryCredential = 'dockerhub'
        gitRepository = 'https://github.com/Rafavermar/CICD-Py-Jenkins-Docker.git'
        gitCredentialsId = 'github'
        projectName = 'M17_jenkins_rvm'
        projectVersion = '1.0'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout Code') {
            steps {
                script{
                    git branch: 'main',
                        credentialsId: gitCredentialsId,
                        url: gitRepository
                }
            }
        }

        stage('Code Analysis'){
            environment{
                scannerHome= tool 'Sonar'
            }
            steps{
                script{
                    withSonarQubeEnv('Sonar'){
                        sh "${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=$projectName \
                        -Dsonar.projectName=$projectName \
                        -Dsonar.projectVersion=$projectVersion \
                        -Dsonar.sources=./"
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    try {
                        sh 'docker run -d --name $projectName $registry'
                        sh 'sleep 10'
                        sh 'docker logs $projectName'
                    } finally {
                        sh 'docker rm -f $projectName'
                    }
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('',registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script{
                    sh 'docker rmi $registry'}

            }
        }
    }
    post {
        failure {
            echo 'El pipeline ha fallado.'
        }
    }
}
