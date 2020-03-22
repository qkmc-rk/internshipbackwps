package org.whystudio.internship;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2   // 放在有 @Configuration 注解的地方
public class InternshipApplication {
	public static void main(String[] args) {
		SpringApplication.run(InternshipApplication.class, args);
	}
}
