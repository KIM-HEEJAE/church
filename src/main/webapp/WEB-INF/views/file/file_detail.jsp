<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="board-container">
    <div class="detail-header">
        <h2>${board.title}</h2>
        <p>작성일: ${board.reg_date}</p>
    </div>
    
    <div class="detail-content" style="text-align: center; margin-top: 30px;">
        <img src="/resources/uploads/${board.file_stored_name}" 
             alt="주보이미지" 
             style="max-width: 100%; height: auto; border: 1px solid #ccc;">
    </div>

    <div class="btn-area" style="margin-top: 20px; text-align: center;">
        <button onclick="location.href='/file/list'">목록으로</button>
    </div>
</div>