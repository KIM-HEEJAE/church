package com.church.homepage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.church.homepage.mapper") // 이 패키지 아래의 모든 Mapper를 스캔하라고 알려줘야 함
public class ChurchApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChurchApplication.class, args);
	}

}
