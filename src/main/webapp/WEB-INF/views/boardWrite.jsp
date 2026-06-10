<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>교회 앨범 등록</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<body>
<jsp:include page="header.jsp" />

    <h2>앨범 게시글 등록</h2>
    <form action="/board/writeAction" method="post" enctype="multipart/form-data">
        <p>
            제목: <input type="text" name="b_title" required>
        </p>
        <p>
            내용: <br>
            <textarea name="b_content" rows="10" cols="50"></textarea>
        </p>
        <p>
            대표 사진: <input type="file" name="file">
        </p>
        <button type="submit">등록하기</button>
        <button type="button" onclick="history.back()">취소</button>
    </form>
</body>
</html>