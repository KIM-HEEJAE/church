package com.church.homepage.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.church.homepage.dto.BoardDTO;
import com.church.homepage.dto.MemberDTO;
import com.church.homepage.service.BoardService;
import com.church.homepage.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller // 이 클래스가 주소를 제어하는 컨트롤러라고 스프링에게 알림
public class MainController {
@Autowired
	private MemberService memberService;
@Autowired
private BoardService boardService;
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
    @GetMapping("/mypage")
    public String mypage(HttpSession session ,Model model) {
    	MemberDTO dto = (MemberDTO) session.getAttribute("member");
    	
    	if (dto==null) {
    		return "redirect:/login";	
    	}
    	String user_id = dto.getUser_id();
    	MemberDTO memberInfo =memberService.getMemberInfo(user_id);
    	model.addAttribute("dto",memberInfo);
    	return "mypage";
    }
    @PostMapping("/updateProfile")
    public String updateProfile(MemberDTO dto, @RequestParam("file") MultipartFile file, HttpSession session) throws Exception {
        
        // 1. 파일이 있는 경우에만 이미지 처리
        if (!file.isEmpty()) {
            String uploadPath = "C:/work/img/";
            String originalName = file.getOriginalFilename();
            String extension = originalName.substring(originalName.lastIndexOf("."));
            String fileName = UUID.randomUUID().toString() + extension;
            
            File saveFile = new File(uploadPath, fileName);
            file.transferTo(saveFile);
            
            // DTO에 파일명 저장
            dto.setImg(fileName);
        }
        
        // 2. 정보 업데이트 (이미지 포함/미포함 모든 경우)
        // 서비스에서 SQL로 모든 필드를 업데이트하도록 구현되어 있어야 합니다.
        memberService.updateMember(dto);
        
        // 3. 세션 갱신 (화면에 변경된 정보 바로 반영)
        session.setAttribute("member", dto);
        
        return "redirect:/mypage";
    }
 
    }
