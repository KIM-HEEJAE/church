<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/board/editAction" method="post">
    <input type="hidden" name="b_no" value="${board.b_no}">
    
    <input type="text" name="b_title" value="${board.b_title}" required>
    <textarea name="b_content" required>${board.b_content}</textarea>
    
    <button type="submit">수정 완료</button>
</form>
</body>
</html>