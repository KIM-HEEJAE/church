package com.church.homepage.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class SermonDTO {
	private int s_no;
    private String s_title;
    private String s_preacher;
    private Date s_date;
    private String s_scripture;
    private String s_video_url;
    private String s_content;
}
