package com.church.homepage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.church.homepage.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	void insertMember(MemberDTO dto); 
		int checkId(String user_id);
		MemberDTO loginCheck(@Param("user_id") String user_id,@Param("user_pwd") String user_pwd);
	
}
