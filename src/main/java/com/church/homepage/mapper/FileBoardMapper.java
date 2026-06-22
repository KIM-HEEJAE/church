package com.church.homepage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.church.homepage.dto.FileBoardDTO;

import page.PageUtil;

@Mapper
public interface FileBoardMapper {
    // 1. 전체 게시글 목록 조회
    List<FileBoardDTO> getList();
    
    // 2. 게시글 저장
    void insertBoard(FileBoardDTO dto);
    
    // 3. 이미지 정보 저장
    void insertBoardImg(@Param("fbNo") int fbNo, @Param("fileName") String fileName);
    
    // 4. 상세 조회 시 이미지 가져오기
    List<String> getImagesByBno(int fbNo);

	FileBoardDTO getBoard(int id);

	int getTotalCount();

	List<FileBoardDTO> getFblist(PageUtil pageUtil);

	FileBoardDTO viewBoard(int id);

	void deleteImages(int id);

	void deleteBoard(int id);

	void updateBoard(FileBoardDTO dto);
}