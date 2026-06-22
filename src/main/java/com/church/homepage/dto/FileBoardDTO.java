package com.church.homepage.dto;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class FileBoardDTO {
	private int id;
    private String title;
    private String content;
    private Date regDate;
    private List<String> fileNames;
    
}