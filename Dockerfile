FROM openjdk:11-jre
COPY target/*.jar sample.jar
ENTRYPOINT ["java","-jar","/sample.jar"]
