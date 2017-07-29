package com.alan.eurkaserversample;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class EurkaServerSampleApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurkaServerSampleApplication.class, args);
    }
}
