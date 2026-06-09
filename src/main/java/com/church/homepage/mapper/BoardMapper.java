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
}
