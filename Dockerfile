#FROM openjdk
#FROM java:8 as step-one
FROM openjdk:10 as step-one

COPY ./ /var/www/java/
WORKDIR /var/www/java


RUN apt-get update -y && apt-get install -y maven 

#RUN apt-get -y  install vim

RUN mvn clean package -X

#RUN java -jar target/gs-serving-web-content-0.1.0.jar

# https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
# The ENTRYPOINT specifies a command that will always be executed when the container starts. The CMD specifies arguments that will be fed to the ENTRYPOINT.

ENTRYPOINT ["java"]
CMD ["-jar",  "target/gs-serving-web-content-0.1.0.jar"]


EXPOSE 8080

