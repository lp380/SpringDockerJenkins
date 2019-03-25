pipeline {
    
    agent any

       stages {
            stage('Build') {
                steps {
                    echo 'Building..'

                    sh(returnStdout: true, script: '''#!/bin/bash
                        
                       if [ ! "$(docker images | grep spring-image)" ]
                       then
                         # image doesn't exist 
                         sh 'docker build -t spring-image .'
                       fi 

                       if [ "$(docker ps -a | grep spring-container)" ]
                       then
                        # container name exists
                        sh 'docker rm spring-container'
               
                       fi 

                       '''.stripIndent())

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



}
