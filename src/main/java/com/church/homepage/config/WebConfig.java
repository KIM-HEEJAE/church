package com.church.homepage.config;

import org.springframework.context.annotation.Configuration;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    // 1. 기존 방식 (마이페이지용)
	    registry.addResourceHandler("/work/img/**")
	            .addResourceLocations("file:///C:/work/img/");
	            
	    // 2. 새로운 방식 (게시판용)
	    registry.addResourceHandler("/img/**")
	            .addResourceLocations("file:///C:/work/img/");
	}
}