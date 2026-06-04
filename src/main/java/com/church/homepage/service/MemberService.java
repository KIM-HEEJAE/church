package com.church.homepage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.church.homepage.dto.MemberDTO;
import com.church.homepage.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper membermapper;
	
	public void joinMember(MemberDTO dto) {
		membermapper.insertMember(dto);
	}
	public int idCheck(String user_id) {
		return membermapper.checkId(user_id);
	}
	public MemberDTO loginCheck(String user_id, String user_pwd) {
		// TODO Auto-generated method stub
		return membermapper.loginCheck(user_id, user_pwd);
	}
}
