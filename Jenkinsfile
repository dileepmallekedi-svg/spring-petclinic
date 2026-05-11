pipeline {
    agent { label 'SPC' }

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('git checkout') {
            steps {
                
                git url: 'https://github.com/dileepmallekedi-svg/spring-petclinic.git'
                    branch: 'main'
            }
        }

        stage('build and scan') {
            steps {

                withCredentials([
                    string(credentialsId: 'sonar_id', variable: 'SONAR_TOKEN')
                ]) {

                    withSonarQubeEnv('SONAR') {

                        sh '''
                            mvn clean package sonar:sonar \
                            -Dsonar.projectKey=dileepmallekedi-svg_spring-petclinic \
                            -Dsonar.organization=dileepmallekedi-svg \
                            -Dsonar.host.url=https://sonarcloud.io \
                            -Dsonar.login=$SONAR_TOKEN
                        '''
                    }
                }
            }
        }
    }
}