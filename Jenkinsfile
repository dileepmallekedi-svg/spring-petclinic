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
                withCredentials([usernamePassword(credentialsId: 'sonar-1',variable: 'SONAR_TOKEN')]) {
                withSonarQubeEnv('SONAR') {
                sh '''mvn package sonar:sonar \
                -Dsonar.projectKey=dileepmallekedi-svg_spring-petclinic \
                -Dsonar.organization=dileepmallekedi-svg\
                -Dsonar.host.url=https://sonarcloud.io/ \
                -Dsonar.login=$SONAR_TOKEN'''
                }
            }
        }
    }
}
}