FROM maven:4.0.0-rc-5-eclipse-temurin-25-alpine AS build
ADD . /deploy
WORKDIR /deploy
RUN mvn package 

FROM eclipse-temurin:25-noble AS runtime
LABEL project =devops
LABEL author = "Dill"
RUN useradd -m /deploy -s /bin/bash dill
USER dill
WORKDIR /Deploy
COPY --from=build /deploy/target/*.jar dill.jar
EXPOSE 8080
CMD ["java", "-jar", "dill.jar"]