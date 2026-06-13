package com.church.homepage.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.church.homepage.service.SermonService;
@Controller
@RequestMapping("/sermon")

public class SermonController {
	 @Autowired 
     private SermonService sermonService; 
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", sermonService.getList());
	    return "sermon/list"; // views 폴더 안의 sermon 폴더 속 list.jsp를 찾음
	}

	@GetMapping("/view")
	public String view(@RequestParam("s_no") int s_no, Model model) {
		model.addAttribute("sermon", sermonService.getDetail(s_no));
	    return "sermon/view";
	}
}
