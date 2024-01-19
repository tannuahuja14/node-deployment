pipeline {
    environment {
        dockerImageName = "tannuahuja14/react-app"
        dockerImageTag = "v2.0" // Specify the desired tag for your Docker image
        registryCredential = 'dockerhublogin'
    }

    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git 'https://github.com/tannuahuja14/jenkins-kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the specified tag
                    docker.build("-t ${dockerImageName}:${dockerImageTag} .")
                }
            }
        }

        stage('Tag and Push Docker Image') {
            environment {
                registryCredential = 'dockerhublogin'
            }
            steps {
                script {
                    // Tag the Docker image with the specified tag
                    docker.image("${dockerImageName}:${dockerImageTag}").push()
                    
                    // Optionally, you can tag and push with the 'latest' tag
                    docker.image("${dockerImageName}:latest").push()
                }
            }
        }

        stage('Deploying to Kubernetes') {
            steps {
                script {
                    // Deploy the application to Kubernetes using the provided configuration file
                    kubernetesDeploy(configs: 'deploymentservice.yaml', kubeconfigId: 'kubernetes')
                }
            }
        }
    }
}
