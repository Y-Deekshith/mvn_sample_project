pipeline {
    agent { label 'DEV' }
    tools { 
        maven 'Maven3' 
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
                sh 'mv target/*.war target/maven-web-application-${BUILD_NUMBER}.war'
            }
        }
        // stage('Bulding the Image') {
        //     steps {
        //         script {
        //           dockerImage  = docker.build imageName + ":$BUILD_NUMBER"
        //         }
        //     }
        // }
        
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

