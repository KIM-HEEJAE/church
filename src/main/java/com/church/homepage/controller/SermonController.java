package com.church.homepage.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.church.homepage.dto.MemberDTO;
import com.church.homepage.dto.SermonDTO;
import com.church.homepage.service.SermonService;

import jakarta.servlet.http.HttpSession;
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
	@GetMapping("/write")
	public String goWrite(HttpSession session,RedirectAttributes rttr) {
	    // 세션에서 로그인한 아이디를 가져옵니다 (본인 프로젝트의 세션 키명 확인 필수!)
	    MemberDTO dto = (MemberDTO) session.getAttribute("member");
	    
	    if (dto == null || !"admin".equals(dto.getUser_id())) {		   
		   rttr.addFlashAttribute("msg", "권한이 없습니다.");
		   return "redirect:/";
	   }
	    return "sermon/write"; // 글쓰기 JSP 페이지

	}
	// 글쓰기 폼에서 전송한 데이터를 처리
    @PostMapping("/writeAction")
    public String writeAction(SermonDTO sermon, HttpSession session, RedirectAttributes rttr) {
        MemberDTO dto = (MemberDTO) session.getAttribute("member");

        // 글 저장 시에도 권한 체크 (안전 장치)
        if (dto == null || !"admin".equals(dto.getUser_id())) {
            rttr.addFlashAttribute("msg", "권한이 없습니다.");
            return "redirect:/";
        }

        // DB에 저장 (서비스 호출)
        sermonService.register(sermon);
        
        // 저장이 완료되면 목록으로 리다이렉트
        return "redirect:/sermon/list";
    }
}
