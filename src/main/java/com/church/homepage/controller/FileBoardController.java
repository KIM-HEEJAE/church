package com.church.homepage.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.church.homepage.dto.FileBoardDTO;
import com.church.homepage.dto.MemberDTO;
import com.church.homepage.service.FileBoardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FileBoardController {

    @Autowired
    private FileBoardService fileBoardService; // 서비스 클래스 (DB 조회 로직)

    // 리스트 페이지
    @GetMapping("/file/list")
    public String list(Model model) {
        model.addAttribute("boardList", fileBoardService.getList());
        return "file/file_list";
    }
    @GetMapping("/file/write")
    public String writeForm(HttpSession session) {
        // 세션에서 로그인 정보 가져오기
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        
        // 로그인이 안 되어있거나, 아이디가 'admin'이 아니면 리스트로 튕겨내기
        if (member == null || !"admin".equals(member.getUser_id())) {
            return "redirect:/file/list";
        }
        
        return "file/write_form";
    }
    @PostMapping("/file/write")
    public String write(FileBoardDTO dto, // 제목 등 form 데이터 자동 매핑
                        @RequestParam("files") MultipartFile[] files, 
                        HttpSession session) throws Exception {

        // 1. 관리자 권한 확인 (보안)
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member == null || !"admin".equals(member.getUser_id())) {
            return "redirect:/file/list";
        }

        // 2. 파일 저장 로직 (여러 개 반복 처리)
        List<String> fileNames = new ArrayList<>();
        String uploadPath = "C:/uploads/";
        
        // 폴더 없으면 자동 생성
        File directory = new File(uploadPath);
        if (!directory.exists()) directory.mkdirs();

        if (files != null && files.length > 0) {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                    File saveFile = new File(uploadPath, fileName);
                    file.transferTo(saveFile);
                    fileNames.add(fileName); // 파일 이름을 리스트에 담음
                }
            }
        }

        // 3. 서비스 호출 (게시글 + 파일 리스트 전달)
        // 이전 단계에서 만든, @Transactional이 적용된 그 save 메서드를 호출합니다.
        fileBoardService.save(dto, fileNames);

        return "redirect:/file/list";
    }
    // 상세 페이지
    @GetMapping("/file/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        model.addAttribute("board", fileBoardService.getDetail(id));
        return "file/file_detail";
    }
}