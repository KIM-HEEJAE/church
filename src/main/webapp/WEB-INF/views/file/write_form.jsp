<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주보 등록</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <jsp:include page="../header.jsp" />
</head>
<body>
    <h2>새 주보 등록</h2>
    
    <form action="/file/write" method="post" enctype="multipart/form-data">
    제목: <input type="text" name="title"><br>
    내용: <textarea name="content"></textarea><br>
    파일: <input type="file" name="files" multiple><br>
    <button type="submit">등록</button>
</form>
</body>
</html>