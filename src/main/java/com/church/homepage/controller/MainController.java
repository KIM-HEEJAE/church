package com.church.homepage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.church.homepage.dto.MemberDTO;
import com.church.homepage.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller // 이 클래스가 주소를 제어하는 컨트롤러라고 스프링에게 알림
public class MainController {
@Autowired
	private MemberService memberService;
    @GetMapping("/") 
    public String mainPage() {
        return "main"; 
    }
    @GetMapping("/login")
    public String login() {
    	return "login";
    }
    @GetMapping("/join")
    	public String join() {
    		return "join";
    	}
    @PostMapping("/joincomplete")
    	public String joincomplete(MemberDTO dto) {
    	System.out.println(dto.toString());
    	memberService.joinMember(dto);
    	return "main";
    	
    }
    @PostMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam("user_id") String user_id) {
    	int result = memberService.idCheck(user_id);
    	if(result !=0) {
    		return "fail";
    	}else {
    		return "success";
    	}
    }
    @PostMapping("/loginAction")
    public String loginAction(@RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd, HttpSession session , RedirectAttributes rttr) {
    	MemberDTO dto = memberService.loginCheck(user_id,user_pwd);
    	if (dto != null) {
        	session.setAttribute("member",dto);
        	return "redirect:/";
    	}else {
    		rttr.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
    		return "redirect:/login";
    	}
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    	
    }
    }
