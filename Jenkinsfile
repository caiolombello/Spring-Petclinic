pipeline {
    agent any

    stages {

        stage("build docker image") {
            
            steps {
                sh 'docker build -t spring-petclinic/app .'
            }
        
        }

        stage("deploy docker compose") {
            
            steps {
                sh 'docker-compose up --build -d'
            }

        }

        stage("deploying containers") {
            
            steps {
                sh 'sleep 10'
            }

        }

        stage("test") {

            steps {
                sh 'chmod +x test-app.sh'
                sh './test-app.sh'
            }

        }
    }
}