	package com.church.homepage.controller;
	
	import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.church.homepage.dto.BoardDTO;
import com.church.homepage.dto.MemberDTO;
import com.church.homepage.service.BoardService;

import jakarta.servlet.http.HttpSession;
import page.PageUtil;
	@Controller
	@RequestMapping("/board")
	public class BoardController {
		@Autowired
		private BoardService boardService;
		@GetMapping("")
	    public String boardRedirect() {
	        return "redirect:/board/list";
	    }
		@GetMapping("/list")
		public String boardList(@RequestParam(defaultValue = "1") int curPage, Model model) {
		    // 1. 전체 글 개수 조회
		    int count = boardService.getTotalCount();
		    
		    // 2. PageUtil 객체 생성 (데이터 개수, 현재 페이지 전달)
		    PageUtil pageUtil = new PageUtil(count, curPage);
		    
		    // 3. 페이지에 맞는 글 목록 조회 (시작번호, 끝번호 활용)
		    List<BoardDTO> boardList = boardService.getBoardList(pageUtil);
		    
		    // 4. 모델에 담아서 JSP로 전달
		    model.addAttribute("boardList", boardList);
		    model.addAttribute("page", pageUtil);
		    
		    return "boardList";
		}
		@GetMapping("/view")
		public String viewBoard(@RequestParam("b_no") int b_no, Model model) {
		    // 1. 상세 게시글 조회 (서비스에 viewBoard 메서드 필요)
		    BoardDTO board = boardService.viewBoard(b_no);
		    model.addAttribute("board", board);
		    return "board"; // board.jsp로 이동
		}
		

	    // 실제 글 등록 처리
	   
	    @GetMapping("/write")
	    public String writeForm(HttpSession session, RedirectAttributes rttr) {
	        MemberDTO dto = (MemberDTO) session.getAttribute("member");
	        if (dto == null || dto.getIdx() != 1) { // 관리자(idx=1)만 접근 가능
	            rttr.addFlashAttribute("msg", "권한이 없습니다.");
	            return "redirect:/";
	        }
	        return "boardWrite"; 
	    }
	 // 2. 글을 실제로 DB에 저장하는 메서드 (POST)
	    @PostMapping("/writeAction")
	    public String writeAction(BoardDTO board, 
	                              @RequestParam("file") MultipartFile file, 
	                              HttpSession session) throws Exception {
	        
	        MemberDTO dto = (MemberDTO) session.getAttribute("member");
	        if(dto == null || dto.getIdx() != 1) {
	            return "redirect:/";
	        }
	        
	        // 파일 처리
	        if (!file.isEmpty()) {
	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            File saveFile = new File("C:/work/img/", fileName);
	            file.transferTo(saveFile);
	            board.setB_img(fileName);
	        }
	        
	        board.setB_writer(dto.getUser_id());
	        boardService.insertBoard(board); // 이 메서드와 Mapper의 ID를 꼭 맞추세요!
	        
	        return "redirect:/board/list";
	    }
	}
