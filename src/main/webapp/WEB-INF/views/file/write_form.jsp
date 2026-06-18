<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주보 등록</title>
</head>
<body>
    <h2>새 주보 등록</h2>
    
    <form action="/file/write" method="post" enctype="multipart/form-data">
        <div>
            <label>제목</label>
            <input type="text" name="title" required>
        </div>
        <div>
    <label>주보 파일 (다중 선택 가능)</label>
    <input type="file" name="files" multiple accept="image/*,application/pdf" required>
</div>
        <button type="submit">등록하기</button>
        <button type="button" onclick="history.back()">취소</button>
    </form>
</body>
</html>