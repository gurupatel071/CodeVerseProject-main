package com.Grownited;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;

@SpringBootApplication
public class SpringHeackathonProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringHeackathonProjectApplication.class, args);
	}
	
	@Bean
	PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	Cloudinary getCloudinary() {
		Map<String, String> config = new HashMap<>();
		config.put("cloud_name", "djt9utyoa");
		config.put("api_key", "514661749946225");
		config.put("api_secret", "qad_EinOxEf0geeITyT7rOTgSDE");
		return new Cloudinary(config);
	}
	

}
