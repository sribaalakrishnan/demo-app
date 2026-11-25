FROM eclipse-temurin:21-jre
COPY target/demo-app-1.0.jar /app.jar
CMD ["java", "-cp", "/app.jar", "com.demo.App"]
