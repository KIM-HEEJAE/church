package com.church.homepage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void writeBoard(BoardDTO board) {
		// TODO Auto-generated method stub
		boardMapper.writeBoard(board);
		
	}
	public void insertBoardImage(int b_no, String fileName) {
		// TODO Auto-generated method stub
		boardMapper.insertBoardImage(b_no,fileName);
	}
	public List<String> getImagesByBno(int b_no) {
		// TODO Auto-generated method stub
		return boardMapper.getImagesByBno(b_no);	}
	public BoardDTO getBoard(int b_no) {
	    // null 대신 매퍼의 결과값을 리턴해야 합니다.
	    return boardMapper.getBoard(b_no);
	}
	@Transactional // DB 처리가 두 번 일어나므로 트랜잭션 필수!
	public void deleteBoard(int b_no) {
	    boardMapper.deleteImages(b_no); // 1. 자식(이미지) 삭제
	    boardMapper.deleteBoard(b_no);  // 2. 부모(게시글) 삭제
	}
	public void updateBoard(BoardDTO board) {
		// TODO Auto-generated method stub
		boardMapper.updateBoard(board);
	}

}
