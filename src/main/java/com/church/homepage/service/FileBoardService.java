package com.church.homepage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.church.homepage.dto.FileBoardDTO;
import com.church.homepage.mapper.FileBoardMapper;

import page.PageUtil;
@Service
public class FileBoardService {
    @Autowired FileBoardMapper mapper;

    @Transactional
    public void save(FileBoardDTO dto, List<String> fileNames) {
        mapper.insertBoard(dto); // 1. 게시글 저장
        
        // 2. 파일 리스트 저장
        for(String fileName : fileNames) {
            mapper.insertBoardImg(dto.getId(), fileName);
        }
    }

	public List<FileBoardDTO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	public FileBoardDTO getBoard(int id) {
	    return mapper.getBoard(id); // Mapper에 getBoard(id) 쿼리 필요
	}
	public List<String> getImages(int id) {
        return mapper.getImagesByBno(id);
    }

	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	public List<FileBoardDTO> getFblist(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return mapper.getFblist(pageUtil);
	}

	public FileBoardDTO detail(int id) {
		// 1. 게시글 기본 정보 조회
	    FileBoardDTO dto = mapper.viewBoard(id);
	    
	    // 2. 해당 게시글의 이미지 파일명 리스트 조회 (테이블에서 가져오기)
	    List<String> images = mapper.getImagesByBno(id);
	    
	    // 3. DTO에 이미지 리스트 세팅
	    dto.setFileNames(images);
	    
	    return dto;
	}
	@Transactional
    public void remove(int id) {
        // 1. 먼저 이미지 정보 삭제
        mapper.deleteImages(id);
        // 2. 게시글 삭제
        mapper.deleteBoard(id);
    }
	@Transactional
    public void update(FileBoardDTO dto, List<String> fileNames) {
        mapper.updateBoard(dto);
        if (fileNames != null && !fileNames.isEmpty()) {
            // (선택사항) 물리적인 실제 파일 삭제 로직 추가 가능:
            // List<String> oldFiles = mapper.getImagesByBno(dto.getId());
            // for(String f : oldFiles) { new File(UPLOAD_PATH + f).delete(); }
            
            // 3. 기존 이미지 DB 데이터 삭제
            mapper.deleteImages(dto.getId());
            
            // 4. 새 이미지 DB 데이터 삽입
            for(String fileName : fileNames) {
                mapper.insertBoardImg(dto.getId(), fileName);
            }
        }
    }
}
