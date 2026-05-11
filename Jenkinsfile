pipeline {
    agent{label 'JAVA'}
    triggers {
        pollSCM('* *  * * *')
    }
    stages {
        stage('git checkout') {
            steps {
                git url 'https://github.com/dileepmallekedi-svg/spring-petclinic.git'
                branch: 'main'
            }
        }
        stage('build and scan') {
            steps {
                withCrendentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) 
                withsonarQubeEnv('sonar') {
                sh '''mvn package sonar:sonar 
                -Dsonar.projectKey=dileepmallekedi-svg_spring-petclinic \
                -Dsonar.organization=dileepmallekedi-svg \
                -Dsonar.host.url=https://sonarcloud.io/ \
                -Dsonar.login=$SONAR_TOKEN'''
                }
            }
        }
    }
    
}