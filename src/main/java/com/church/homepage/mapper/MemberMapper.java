package com.church.homepage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.church.homepage.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	void insertMember(MemberDTO dto); 
		int checkId(String user_id);
		MemberDTO loginCheck(@Param("user_id") String user_id,@Param("user_pwd") String user_pwd);
		String findIdByNameAndBirth(@Param("user_name") String user_name, @Param("birth_date") String birth_date);	
		MemberDTO checkUser(@Param("user_id") String user_id, @Param("email") String email);
		void updatePassword(@Param("user_id") String user_id, @Param("tempPwd") String tempPwd);
}
