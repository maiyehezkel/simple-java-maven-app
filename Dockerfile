FROM maven:latest as builder

WORKDIR /project

COPY src ./src

COPY pom.xml .

RUN mvn -DskipTests clean package

FROM openjdk:11

COPY --from=builder /project/target/my-app-*.jar /home/ubuntu/my-app.jar

CMD ["java","-jar","/home/ubuntu/my-app.jar"]
