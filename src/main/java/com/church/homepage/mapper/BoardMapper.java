package com.church.homepage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.church.homepage.dto.BoardDTO;

import page.PageUtil;

@Mapper
public interface BoardMapper {
	BoardDTO viewBoard(int b_no);
	void insertBoard(BoardDTO board);
	int getTotalCount(); // 추가
	List<BoardDTO> getBoardList(PageUtil pageUtil);
	void writeBoard(BoardDTO board);
	void insertBoardImage(int b_no, String fileName);
	List<String> getImagesByBno(int b_no);
	BoardDTO getBoard(int b_no);
	void deleteImages(int b_no);
	void deleteBoard(int b_no);
	void updateBoard(BoardDTO board);
	
}
