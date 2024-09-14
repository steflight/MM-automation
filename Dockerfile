FROM eclipse-temurin:17-jdk-focal

WORKDIR /app

# Créer un utilisateur non-root avec un UID/GID explicite
RUN groupadd -g 1000 appgroup && \
    useradd -u 1000 -g appgroup -m appuser

COPY --chown=appuser:appgroup .mvn/ .mvn
COPY --chown=appuser:appgroup mvnw pom.xml ./

# Donner les permissions nécessaires
RUN chmod +x mvnw

USER appuser

RUN ./mvnw dependency:go-offline

COPY --chown=appuser:appgroup src ./src

CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.jvmArguments='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005'"]