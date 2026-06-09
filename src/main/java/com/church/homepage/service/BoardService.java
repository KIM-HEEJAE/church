package com.church.homepage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.church.homepage.dto.BoardDTO;
import com.church.homepage.mapper.BoardMapper;

import page.PageUtil;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public void insertBoard(BoardDTO board) {
        boardMapper.insertBoard(board);
    }
    public List<BoardDTO> getBoardList(PageUtil pageUtil) {
        return boardMapper.getBoardList(pageUtil);
    }
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return boardMapper.getTotalCount();
	}
	public BoardDTO viewBoard(int b_no) {
        return boardMapper.viewBoard(b_no);
    }

}
