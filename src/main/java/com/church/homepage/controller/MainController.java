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
    	System.out.println(memberInfo);
    	return "mypage";
    }
    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam("file") MultipartFile file, HttpSession session) throws Exception {
        if (!file.isEmpty()) {
            String uploadPath = "C:/work/img/";
            
            // 1. 원본 파일명에서 확장자(예: .jpg, .png, .webp)만 추출
            String originalName = file.getOriginalFilename();
            String extension = originalName.substring(originalName.lastIndexOf("."));
            
            // 2. 한글 없이 UUID + 확장자로 파일명 생성
            String fileName = UUID.randomUUID().toString() + extension;
            
            // 3. 파일 저장
            File saveFile = new File(uploadPath, fileName);
            file.transferTo(saveFile);
            
            // 4. DB 및 세션 업데이트
            MemberDTO dto = (MemberDTO) session.getAttribute("member");
            dto.setImg(fileName); 
            memberService.updateImg(dto.getUser_id(), fileName);
            session.setAttribute("member", dto);
        }
        return "redirect:/mypage";
    }
 // 글쓰기 페이지 진입 시 관리자 권한 확인
    @GetMapping("/board/write")
    public String writePage(HttpSession session, RedirectAttributes rttr) {
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
        
        // 권한 체크
        if (dto == null || !"admin".equals(dto.getUser_id())) {
            // 일회성 경고 메시지 전달
            rttr.addFlashAttribute("msg", "글을 쓸 권한이 없습니다.");
            return "redirect:/"; // 메인으로 이동
        }
        return "boardWrite";
    }
    @PostMapping("/board/writeAction")
    public String writeAction(BoardDTO board, 
                              @RequestParam("file") MultipartFile file, 
                              HttpSession session) throws Exception {
        
        // 1. 관리자 권한 체크 (한 번 더 확인)
        MemberDTO dto = (MemberDTO) session.getAttribute("member");
        if(dto == null || !"admin".equals(dto.getUser_id())) {
            return "redirect:/";
        }
        
        // 2. 파일 업로드 로직
        if (!file.isEmpty()) {
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File saveFile = new File("C:/work/img/", fileName);
            file.transferTo(saveFile);
            board.setB_img(fileName);
        }
        
        // 3. 작성자 설정
        board.setB_writer(dto.getUser_id());
        
        // 4. 서비스 호출
        boardService.insertBoard(board);
        
        return "redirect:/board/list";
    }
    }
