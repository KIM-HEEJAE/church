<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<jsp:include page="../header.jsp" />

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/file/update" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${board.id}">
    제목: <input type="text" name="title" value="${board.title}">
    <br>
    기존 파일: 
    <c:forEach var="img" items="${board.fileNames}">
        <span>${img}</span><br>
    </c:forEach>
    <br>
    새 이미지 선택 (선택 시 기존 이미지 교체):
    <input type="file" name="files" multiple>
    <br>
    <button type="submit">수정 완료</button>
</form>

</body>
</html>