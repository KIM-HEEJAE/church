package com.church.homepage.dto;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Data
public class FileBoardDTO {
    private int id;
    private String title;
    private String file_original_name;
    private String file_stored_name;
    private Date reg_date;
}