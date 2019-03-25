pipeline {
    
    agent any

       stages {
            stage('Build') {
                steps {
                    echo 'Building..'
                    sh 'docker build -t spring-image .'
                    sh 'docker run -it --name spring-container spring-image'
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing..'
                        sh 'mvn --version'

                }
            }


            stage('Deploy') {
                steps {
                    echo 'Deploying....'
                }
            }
        }



}
