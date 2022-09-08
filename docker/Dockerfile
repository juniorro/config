FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8085
ENTRYPOINT ["java","-jar","app.jar"]
