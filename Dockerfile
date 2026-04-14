FROM maven:4.0.0-rc-5-eclipse-temurin-25-alpine AS build
ADD . /deploy
WORKDIR /deploy
RUN mvn package 

FROM eclipse-temurin:25-noble AS runtime
WORKDIR /Deploy
COPY --from=build /deploy/target/*.jar dill.jar
EXPOSE 8080
CMD ["java", "-jar", "dill.jar"]