pipeline {
    agent any

    stages {
        stage('Build and Deploy') {
            steps {
                script {
                    sh 'echo $USER'
                    sh 'docker --version'
                    sh 'docker compose -f docker-compose.staging.yml up -d --build'
                }
            }
        }
    }
}
