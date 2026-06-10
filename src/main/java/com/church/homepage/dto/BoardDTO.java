package com.church.homepage.dto;

import java.sql.Clob;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_img;
	private String b_writer;
	private Date b_date;
}
