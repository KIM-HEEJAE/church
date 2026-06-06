package com.church.homepage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class IntroController {

	@GetMapping("/intro/hi")
	public String hiPage() {
		return "intro/hi";
	}
	@GetMapping("/intro/time")
	public String timePage() {
		return "intro/time";
	}
	@GetMapping("/intro/people")
	public String peoplePage() {
		return "intro/people";
	}
	@GetMapping("/intro/history")
	public String historyPage() {
		return "intro/history";
	}
	@GetMapping("/intro/guide")
	public String guidePage() {
		return "intro/guide";
	}
	@GetMapping("/intro/location")
	public String locationPage() {
		return "intro/location";
	}
}
