pipeline {
    agent any
    tools { 
        maven 'mymaven' 
    }

    stages {
        stage('Bulding the code') {
            steps {
                sh 'mvn compile'
                sh 'mvn package'
                sh 'mvn install'
            }
        }
        stage('Bulding the Image') {
            steps {
                script {
                  dockerImage  = docker.build imageName + ":$BUILD_NUMBER"
                }
            }
        }
        
        stage('Publishing the Image') {
            steps {
                script {
                    docker.withRegistry( '', registrycred ) {
                    dockerImage.push()
                    }
                }
            }
        }
    }
}

