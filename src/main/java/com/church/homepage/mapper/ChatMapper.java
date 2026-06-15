package com.church.homepage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.church.homepage.dto.ChatDTO;
@Mapper
public interface ChatMapper {
	void insertMessage(ChatDTO chatDTO);      // 메시지 저장
    List<ChatDTO> getRecentMessages();       // 최근 메시지 50개 불러오기
}
