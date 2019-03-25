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

       mail to: 'lmp004@lvc.edu',  body: 'body of email', subject: 'The pipeline has succeeded'
    }

    failure {
       mail to: 'lmp004@lvc.edu',  body: 'body of email', subject: 'The pipeline has failed'
    }


}

}
