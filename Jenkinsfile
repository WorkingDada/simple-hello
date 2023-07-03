pipeline {
    agent any
    stages {
        stage('Check Git Version') {
            steps {
                sh 'git --version'
            }
        }
        
        stage('Clone Repository') {
            steps {
                checkout([$class: 'GitSCM', 
                          branches: [[name: '*/main']],
                          userRemoteConfigs: [[url: 'https://github.com/WorkingDada/simple-hello.git']]])
            
                sh "ls -al"
            }
        }
        
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t pttzx/python-hello:1.0 -f ./dockerfile .'
                    sh 'docker run pttzx/python-hello:1.0'
                }
            }
        }
        
        stage('Push') {
            steps {
                script {
                    // docker.withRegistry('https://hub.docker.com', '2ac56da6-f375-4326-8e84-126f2c4b5463') {
                        sh 'docker image push pttzx/python-hello:1.0'
                    // }
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