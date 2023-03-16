# FROM openjdk:11

# COPY target/jb-hello-world-maven-0.1.0.jar  myapp.jar

# ENTRYPOINT ["java","-jar","myapp.jar"]

FROM tomcat:8.0.20-jre8
#### Good stuff
COPY target/jb-hello-world-maven-0.1.0.jar /usr/local/tomcat/webapps/myapp.jar
