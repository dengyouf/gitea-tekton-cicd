package io.linux.helloword;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HellowordApplication {

	public static void main(String[] args) {

		SpringApplication.run(HellowordApplication.class, args);
	}
	@GetMapping("/api")
	public String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
		return String.format("<span style='color: red;font-weight: bold;'>Main Branch v2.1.1<span>----Hello %s! ", name);
	}

}
