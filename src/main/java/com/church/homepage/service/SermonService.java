package com.church.homepage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.church.homepage.dto.SermonDTO;
import com.church.homepage.mapper.SermonMapper;
@Service
public class SermonService {
	@Autowired
	SermonMapper sermonMapper;
	public List<SermonDTO> getList(){
		return sermonMapper.getList();
	}
	public SermonDTO getDetail(int s_no) {
		return sermonMapper.getDetail(s_no);
	}
}
