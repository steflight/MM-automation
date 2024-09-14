package com.main.maic;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class MaicApplication {

	@RequestMapping("/")
	public String home() {
		return "Welcome home haha ok on y vas";
	}

	@GetMapping("/test")
	public Map<String, Integer> test() {
		return Map.of("id", 10);
	}

	public static void main(String[] args) {
		SpringApplication.run(MaicApplication.class, args);
	}

}
