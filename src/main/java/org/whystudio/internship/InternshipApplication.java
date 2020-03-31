package org.whystudio.internship;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.whystudio.internship.util.IpTool;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.io.File;

@Slf4j
@SpringBootApplication
@EnableSwagger2   // 放在有 @Configuration 注解的地方
public class InternshipApplication implements ApplicationRunner {
	@Value("${server.port}")
	public int port;

	@Value("${server.servlet.context-path}")
	public String context;

	@Override
	public void run(ApplicationArguments args) throws Exception {
		log.info("Tomcat服务启动完成: http://{}:{}{}", "ruankun.xyz", port,context);
		log.info("Swagger2 API文档: http://{}:{}{}/swagger-ui.html", "ruankun.xyz", port,context);
	}

	public static void main(String[] args) {
		SpringApplication.run(InternshipApplication.class, args);
	}
}
