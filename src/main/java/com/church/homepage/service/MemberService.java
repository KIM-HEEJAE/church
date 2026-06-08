package com.church.homepage.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.church.homepage.dto.MemberDTO;
import com.church.homepage.mapper.MemberMapper;

@Service
public class MemberService {
	
	  @Autowired private JavaMailSender mailSender;
	 
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

	public String findIdByNameAndBirth(String user_name, String birth_date) {
		return membermapper.findIdByNameAndBirth(user_name, birth_date);
	}
	
	public boolean findPassword(String user_id, String email) {
	    MemberDTO member = membermapper.checkUser(user_id, email);
	  
	    if (member != null) {
	        String tempPwd = UUID.randomUUID().toString().substring(0, 8);
	        membermapper.updatePassword(user_id, tempPwd);
	      
	        // 4. 메일 발송 
	        SimpleMailMessage message = new SimpleMailMessage();
	        
	        // ★ 이 줄이 핵심입니다. 반드시 추가하세요!
	        message.setFrom("khjae0426@naver.com"); 
	        
	        message.setTo(email); 
	        message.setSubject("홍제감리교회 임시 비밀번호입니다.");
	        message.setText("회원님의 임시 비밀번호는 " + tempPwd + " 입니다.");
	        mailSender.send(message);
	      
	        return true; 
	    } 
	    return false; 
	}
	 
}
