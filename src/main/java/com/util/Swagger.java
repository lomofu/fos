package com.util;

import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

public class Swagger {
    @Configuration
    @EnableSwagger2
    @EnableWebMvc
    public class SwaggerConfig {

        @Bean
        public Docket createRestApi() {
            return new Docket(DocumentationType.SWAGGER_2)
                    .apiInfo(apiInfo()).select()
                    //扫描指定包中的swagger注解
                    //.apis(RequestHandlerSelectors.basePackage("cn.exrick.controller"))
                    //扫描所有有注解的api，用这种方式更灵活
                    .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                    .paths(PathSelectors.any())
                    .build();
        }

        private ApiInfo apiInfo() {
            return new ApiInfoBuilder()
                    .title("Assessment网站API")
                    .description("filmos项目API接口文档")
                    .termsOfServiceUrl("https://www.baidu.com/")
                    .license("lomofu@qq.com")
                    .version("3.0")
                    .build();
        }


    }

}
