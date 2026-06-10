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
		    for(BoardDTO b : boardList) {
		    }
		    // 4. 모델에 담아서 JSP로 전달
		    model.addAttribute("boardList", boardList);
		    model.addAttribute("page", pageUtil);
		    
		    return "boardList";
		}
		/*
		 * @GetMapping("/view") public String viewBoard(@RequestParam("b_no") int b_no,
		 * Model model) { // 1. 상세 게시글 조회 (서비스에 viewBoard 메서드 필요) BoardDTO board =
		 * boardService.viewBoard(b_no); model.addAttribute("board", board); return
		 * "board"; // board.jsp로 이동 }
		 */
		

		@GetMapping("/write")
		public String writeForm(HttpSession session, RedirectAttributes rttr) {
		    MemberDTO dto = (MemberDTO) session.getAttribute("member");
		    
		    // 이제 idx(숫자)가 아닌 user_id(문자열)로 관리자 체크
		    if (dto == null || !"admin".equals(dto.getUser_id())) {
		        rttr.addFlashAttribute("msg", "권한이 없습니다.");
		        return "redirect:/";
		    }
		    return "boardWrite"; 
		}

		@PostMapping("/writeAction")
		public String writeAction(BoardDTO board, 
		                          @RequestParam("files") MultipartFile[] files, // 배열로 변경
		                          HttpSession session) throws Exception {
		    
		    MemberDTO dto = (MemberDTO) session.getAttribute("member");
		    
		    if(dto == null || !"admin".equals(dto.getUser_id())) {
		        return "redirect:/";
		    }
		    
		    board.setB_writer(dto.getUser_id());
		    
		    // 1. 게시글 기본 정보 저장 (Mapper에서 b_no를 채워준다고 가정)
		    boardService.insertBoard(board); 
		    int b_no = board.getB_no(); // 저장 후 생성된 b_no 가져오기
		    
		    // 2. 파일 배열 반복 처리
		    if (files != null && files.length > 0) {
		        for (MultipartFile file : files) {
		            if (!file.isEmpty()) {
		                String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		                File saveFile = new File("C:/work/img/", fileName);
		                file.transferTo(saveFile);
		                
		                // 3. 각각의 이미지 정보를 별도 테이블(BOARD_IMG)에 저장
		                boardService.insertBoardImage(b_no, fileName); 
		            }
		        }
		    }
		    
		    return "redirect:/board/list";
		}
		@GetMapping("/view")
		public String view(@RequestParam("b_no") int b_no, Model model) {
		    BoardDTO board = boardService.getBoard(b_no);
		    List<String> imgList = boardService.getImagesByBno(b_no); // 이미지 리스트 조회
		    
		    model.addAttribute("board", board);
		    model.addAttribute("imgList", imgList);
		    return "view"; // view.jsp로 이동
		}
		@GetMapping("/delete")
		public String delete(@RequestParam("b_no") int b_no) {
		    boardService.deleteBoard(b_no);
		    return "redirect:/board/list";
		}
		// 1. 수정 화면 보여주기
		@GetMapping("/edit")
		public String editForm(@RequestParam("b_no") int b_no, Model model) {
		    BoardDTO board = boardService.getBoard(b_no); // 기존 내용 가져오기
		    model.addAttribute("board", board);
		    return "edit"; // edit.jsp로 이동
		}

		// 2. 수정 내용 저장
		@PostMapping("/editAction")
		public String editAction(BoardDTO board) {
		    boardService.updateBoard(board);
		    return "redirect:/board/view?b_no=" + board.getB_no();
		}
	}
