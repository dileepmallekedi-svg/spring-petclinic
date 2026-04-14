FROM maven:4.0.0-rc-5-eclipse-temurin-25-alpine AS build
ADD . /deploy
WORKDIR /deploy
RUN mvn package 

FROM eclipse-temurin:25-noble AS runtime
LABEL project =devops
LABEL author = "Dill"
RUN useradd -m -d /deploy -s /bin/bash dill
USER dill
WORKDIR /deploy
COPY --from=build /deploy/target/*.jar dill.jar
EXPOSE 8080
CMD ["java", "-jar", "dill.jar"]