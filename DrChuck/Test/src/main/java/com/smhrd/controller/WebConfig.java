package com.smhrd.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	   @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/t/images/pose/**")
	                .addResourceLocations("file:///C:/eGovFrame-4.0.0/workspace.edu/Test/src/main/resources/static/images/pose/");
	    }
}