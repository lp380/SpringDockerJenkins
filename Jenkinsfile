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
                 
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing..'
                    sh 'docker create --name temporary-container spring-image'
                    sh 'docker cp temporary-container:/var/www/java/target/surefire-reports .'
                    sh 'docker rm temporary-container'
                    sh 'ls surefire-reports'
                    junit 'surefire-reports/*.xml'                 
                }
            }


            stage('Deploy') {
                steps {
                    echo 'Deploying....'
                    sh DeleteContainer.sh
                    sh 'docker run -i -d --name spring-container spring-image'
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
