package com.church.homepage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.church.homepage.dto.FileBoardDTO;
import com.church.homepage.mapper.FileBoardMapper;
@Service

public class FileBoardService {
	@Autowired
	private FileBoardMapper fileboardmapper;
	public List<FileBoardDTO> getList(){
	return fileboardmapper.selectAll();
	}
    public FileBoardDTO getDetail(int id) {
    	return fileboardmapper.selectOne(id);
    }
    @Transactional
    public void save(FileBoardDTO dto, List<String> filename) {
    	fileboardmapper.insertBoard(dto);
    	for (String fileName : filename) {
            fileboardmapper.insertBoardImg(dto.getId(), fileName);
        }
    }
}
