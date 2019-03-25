pipeline {
    
    agent any

       stages {
            stage('Build') {
                steps {
                    echo 'Building..'

                    sh(returnStdout: true, script: '''#!/bin/bash
                       
                     

                       if [ "$(docker images | grep 'spring-image')" ];
                       then
                       echo 'image name does exist'
                         # image doesn't exist 
                         #sh 'docker build -t spring-image .'
                       else
                        echo 'image name DOES NOT exist'
                           
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
