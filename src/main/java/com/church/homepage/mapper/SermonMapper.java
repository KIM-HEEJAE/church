package com.church.homepage.mapper;

import java.util.List;
import com.church.homepage.dto.SermonDTO;

public interface SermonMapper {
    // 설교 목록 가져오기
    List<SermonDTO> getList();
    
    // 설교 상세정보 가져오기
    SermonDTO getDetail(int s_no);
}