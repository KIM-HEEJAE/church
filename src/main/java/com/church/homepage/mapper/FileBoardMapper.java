package com.church.homepage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.church.homepage.dto.FileBoardDTO;

@Mapper
public interface FileBoardMapper {
    // 전체 목록 조회
    List<FileBoardDTO> selectAll();
    
    // 상세 조회
    FileBoardDTO selectOne(int id);
    
    // 데이터 저장
    void insertBoard(FileBoardDTO dto);

    void insertBoardImg(@Param("fb_no") int fb_no, @Param("fbimg_name") String fbimg_name);
    }