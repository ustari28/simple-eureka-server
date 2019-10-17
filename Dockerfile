FROM openjdk:8-jre-slim as openjdk
COPY . /home/app/simple-eureka-server
WORKDIR /home/app/simple-eureka-server
COPY target/eurka-server-sample-*.jar eurka-server-sample-RELEASE.jar
RUN chmod 700 eurka-server-sample-RELEASE.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "-Dfile.encoding=UTF-8", "eurka-server-sample-RELEASE.jar"]