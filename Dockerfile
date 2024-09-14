FROM eclipse-temurin:17-jdk-focal
 
WORKDIR /app
 
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN chmod +x mvnw
RUN chown -R myuser:myuser /app

USER myuser

RUN ls -l mvnw

RUN ./mvnw dependency:go-offline
 
COPY --chown=myuser:myuser src ./src
 
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005'"]