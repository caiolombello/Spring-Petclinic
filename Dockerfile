FROM maven:3.6.3-jdk-11 as build

WORKDIR /app/

COPY src /app/src/
COPY pom.xml /app/

RUN mvn -f /app/pom.xml clean package -DskipTests

FROM adoptopenjdk/openjdk11:latest
COPY --from=build /app/target/spring-petclinic-2.6.0-SNAPSHOT.jar /usr/local/lib/spring-petclinic-2.6.0-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java","-XX:MinHeapFreeRatio=20","-XX:MaxHeapFreeRatio=40", "-jar", "/usr/local/lib/spring-petclinic-2.6.0-SNAPSHOT.jar"]