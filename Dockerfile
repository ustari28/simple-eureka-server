FROM openjdk:8-jre-slim as openjdk
LABEL traefik.enable="true" \
    traefik.docker.network=traefik-nt \
    traefik.http.routers.eureka-server.rule="Path(`/server-eureka`) || PathPrefix(`/eureka/`)" \
    traefik.http.routers.eureka-server.service="eureka-server" \
    traefik.http.routers.eureka-server.entrypoints=web \
    traefik.http.routers.eureka-server.middlewares="eureka-server" \
    traefik.http.services.eureka-server.loadBalancer.server.port="8761" \
    traefik.http.middlewares.eureka-server.stripprefix.prefixes="/server-eureka" \
    traefik.http.routers.eureka-backend.rule="PathPrefix(`/eureka/`)" \
    traefik.http.routers.eureka-backend.service="eureka-backend" \
    traefik.http.routers.eureka-backend.entrypoints=web \
    traefik.http.services.eureka-backend.loadBalancer.server.port="8761"
COPY . /home/app/simple-eureka-server
WORKDIR /home/app/simple-eureka-server
COPY target/eurka-server-sample-*.jar eurka-server-sample-RELEASE.jar
RUN chmod 700 eurka-server-sample-RELEASE.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "-Dfile.encoding=UTF-8", "eurka-server-sample-RELEASE.jar"]