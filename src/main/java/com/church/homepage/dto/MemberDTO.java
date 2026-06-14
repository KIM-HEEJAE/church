package com.church.homepage.dto;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class MemberDTO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private int idx;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String email;
	private String position;
	private Date reg_date;
	private String birth_date;
	private String img;
}
