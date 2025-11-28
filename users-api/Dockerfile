FROM maven:3.9-jdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -DskipTests dependency:resolve
COPY src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:17-jre
COPY --from=build /app/target/*.jar /app/users.jar
EXPOSE 8081
CMD ["java","-jar","/app/users.jar"]