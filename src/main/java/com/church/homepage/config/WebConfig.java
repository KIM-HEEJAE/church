package com.church.homepage.config;

import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /work/img/** 로 요청하면 C:/work/img/ 폴더에서 찾겠다
        registry.addResourceHandler("/work/img/**")
                .addResourceLocations("file:///C:/work/img/");
    }
}