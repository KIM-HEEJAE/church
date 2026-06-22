<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<jsp:include page="../header.jsp" />
<html>
<body>
	<h2>상세 보기</h2>

	<div>
		<h3>제목: ${board.title}</h3>
	</div>

	<hr>

	<div class="image-area">
		<c:forEach var="imgName" items="${board.fileNames}">
			<img src="/files/${imgName}" alt="주보이미지"
				style="max-width: 100%; margin-bottom: 10px;">
			<br>
		</c:forEach>
	</div>

	<a href="/file/list">목록으로</a>
</body>
</html>