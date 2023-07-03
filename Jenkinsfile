pipeline {
    agent any
    stages {
        stage('Initialize Git Repository') {
            steps {
                script {
                    dir('.jenkins/workspace/') {
                        sh 'git init'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build("python-hello:1.0", "-f dockerfile .")

                }
            }
        }
        
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com', '2ac56da6-f375-4326-8e84-126f2c4b5463') {
                        docker.image("python-hello:1.0").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}