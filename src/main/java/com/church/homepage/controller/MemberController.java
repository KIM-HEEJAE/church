package com.church.homepage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.church.homepage.dto.MemberDTO;
import com.church.homepage.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    
    @Autowired
    private MemberService memberService;

    // 1. 회원가입 처리 (경로: /member/joincomplete)
    @PostMapping("/joincomplete")
    public String joinComplete(MemberDTO memberDTO, 
                               @RequestParam("birthYear") String year,
                               @RequestParam("birthMonth") String month,
                               @RequestParam("birthDay") String day) {
        
        String dateStr = year + "-" + month + "-" + day;
        // DTO에 날짜 세팅 로직 (기존 작성하신 코드 유지)
        memberService.joinMember(memberDTO);
        return "redirect:/";
    }

    // 2. 아이디 찾기 처리 (경로: /member/findIdAction)
    @PostMapping("/findIdAction")
    @ResponseBody
    public String findIdAction(@RequestParam("user_name") String user_name,
                               @RequestParam("birthYear") String birth_year,
                               @RequestParam("birthMonth") String birth_month,
                               @RequestParam("birthDay") String birth_day) {
        
        String birthDate = birth_year + "-" + birth_month + "-" + birth_day;
        String foundId = memberService.findIdByNameAndBirth(user_name, birthDate);
        
        // AJAX 통신을 위해 아이디 혹은 'none' 문자열만 반환
        return (foundId != null) ? foundId : "none";
    }

    @GetMapping("/intro/findId")
    public String findIdPage() {
        // 사용자가 실수로 /findId를 입력하면 로그인 페이지로 돌려보냄
        return "intro/findId"; // 혹은 로그인 페이지 URL
    }
    @PostMapping("/findPwAction")
    @ResponseBody
    public String findPwAction(@RequestParam("user_id") String user_id, @RequestParam("email") String email) {
    	boolean isSent = memberService.findPassword(user_id, email);
        
        return isSent ? "success" : "fail";
    	
    }
    @PostMapping("/updateAction")
    public String updateAction(MemberDTO dto , HttpSession session) {
    	if(session.getAttribute("loginId")==null) {
    		return "redirect:/login";
    	}
		memberService.updateMember(dto);
		return "redirect:/mypage";
    	}
    		
    }
