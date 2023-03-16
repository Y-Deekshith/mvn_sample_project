pipeline {
    agent { label 'DEV' }
    tools { 
        maven 'Maven3' 
    }
    environment {
        dockerImage = ''
        AWS_DEFAULT_REGION = "us-east-1"
        IMAGE_REPO_NAME = "devops"
        IMAGE_TAG = "$BUILD_NUMBER"
        REPOSITORY_URI = "https://${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
        ECRcredentials = "ecr:${AWS_DEFAULT_REGION}:Aws_Cred"
    }

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/Y-Deekshith/mvn_sample_project.git'
            }
        }

        stage('Unit test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Integration test') {
            steps {
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage('Maven Build stage') {
            steps {
                sh 'mvn compile'
                sh 'mvn package'
                sh 'mvn clean install'
                // sh 'mv target/jb-hello-world-maven-0.1.0.jar jb-hello-world-maven-${BUILD_NUMBER}.jar'
            }
        }
        stage('Building our image') {
            steps{
                script {
                    dockerImage = docker.build "${IMAGE_REPO_NAME}:$BUILD_NUMBER"
                }
            }
        }
        
        // stage('Publishing the Image') {
        //     steps {
        //         script {
        //             docker.withRegistry( '', registrycred ) {
        //             dockerImage.push()
        //             }
        //         }
        //     }
        // }
    }
}

