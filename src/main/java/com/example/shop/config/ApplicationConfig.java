package com.example.shop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Instant;
import java.time.temporal.ChronoUnit;

@Configuration
public class ApplicationConfig {

    private static final String PROJECT_NAME = "Shop";

    @Bean("projectName")
    public String getProjectName() {
        return PROJECT_NAME;
    }

    @Bean("currentDate")
    public Instant getCurrentDate() {
        return Instant.now();
    }

    @Bean("yesterday")
    public Instant getYesterdayDate() {
        return getCurrentDate().minus(1L, ChronoUnit.DAYS);
    }





}
