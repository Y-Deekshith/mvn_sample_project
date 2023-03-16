FROM openjdk:11

COPY target/jb-hello-world-maven-0.1.0.jar  myapp.jar

ENTRYPOINT ["java","-jar","myapp.jar"]
