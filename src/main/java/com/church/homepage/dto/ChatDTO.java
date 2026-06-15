package com.church.homepage.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ChatDTO {
    private int chat_id;
    private String user_name;
    private String message;
    private Date reg_date;
    private String position;
}