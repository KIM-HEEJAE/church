package com.church.homepage.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.church.homepage.dto.FileBoardDTO;
import com.church.homepage.service.FileBoardService;

import page.PageUtil;

@Controller
public class FileBoardController {

    @Autowired
    FileBoardService service;
    
    // 파일 저장 경로 (운영체제에 맞게 설정)
    private final String UPLOAD_PATH = "C:/work/uploads/";

    // 1. 게시글 목록 페이지
    @GetMapping("/file/list")
    public String list(@RequestParam(defaultValue="1") int curPage, Model model) {
        int count = service.getTotalCount();
        PageUtil pageUtil = new PageUtil(count, curPage);
        
        // 이제 썸네일 처리 없이 리스트만 가져옴
        List<FileBoardDTO> list = service.getFblist(pageUtil);
        
        model.addAttribute("boardList", list);
        model.addAttribute("page", pageUtil);
        return "file/file_list";
    }
    // 2. 글 작성 페이지 이동
    @GetMapping("/file/write")
    public String writeForm() {
        return "file/write_form";
    }

    // 3. 글 작성 처리 (파일 업로드 포함)
    @PostMapping("/file/write")
    public String write(FileBoardDTO dto, @RequestParam("files") MultipartFile[] files) throws Exception {
        List<String> fileNames = new ArrayList<>();

        for (MultipartFile file : files) {
            if (file != null && !file.isEmpty()) {
                String originalName = file.getOriginalFilename();
                String extension = originalName.substring(originalName.lastIndexOf("."));
                // UUID를 사용하여 파일명 중복 방지 및 인코딩 문제 해결
                String fileName = UUID.randomUUID().toString() + extension; 
                
                File saveFile = new File(UPLOAD_PATH, fileName);
                file.transferTo(saveFile);
                fileNames.add(fileName);
            }
        }
        service.save(dto, fileNames);
        return "redirect:/file/list";
    }

    // 4. 게시글 상세 보기 (이미지 목록 포함)
    @GetMapping("/file/detail")
    public String detail(@RequestParam("id") int id, Model model) {
    	// 1. 게시글 상세 정보와 이미지 리스트를 서비스에서 가져옴
        FileBoardDTO dto = service.detail(id);
        
        // 2. 모델에 담아서 JSP로 전달
        model.addAttribute("board", dto);
        
        return "file/file_detail"; // file_detail.jsp로 이동
    }

 
}