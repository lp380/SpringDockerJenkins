pipeline {

environment {

EMAIL_RECIPIENTS = "lmp004@.lvc.edu"

}


    agent any

        stages {
            stage('Build') {
                steps {
                    echo 'Building..'
                    sh 'docker build -t spring-image .'
                    sh 'docker rm spring-container'
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
                        sh 'docker run -i --name spring-container spring-image'
                }
            }
        }

post {
    always {
        sh 'echo finished...'
    }

    failure {
        emailext body: 'body of email', mail to: EMAIL_RECIPIENTS, subject: 'The pipeline has failed'
    }


}

}
