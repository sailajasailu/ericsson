# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="arunstiwari@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 9080 available to the world outside this container
EXPOSE 9080

# The application's jar file
ARG JAR_FILE=target/user-registration-application-1.3.8.RELEASE.jar

# Add the application's jar to the container
ADD ${JAR_FILE} user-registration-application.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/user-registration-application.jar"]