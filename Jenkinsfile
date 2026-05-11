pipeline {

    agent { label 'SPC' }
     triggers { 
         pollSCM('* * * * *')
     }

    stages {

        stage('git checkout') {
            steps {
                git url: 'https://github.com/spring-projects/spring-petclinic.git',
                    branch: 'main'
            }
        }

        stage('build and scan') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'sonar_id',variable: 'SONAR_TOKEN')]) {
                withSonarQubeEnv('SONAR') {
                sh 'mvn package sonar:sonar'
                }
            }
        }
    }
}