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
	
	<div class="btn-group" style="margin-top: 20px;">
    <a href="/file/list" class="btn btn-list">목록으로</a>
    
    <c:if test="${not empty sessionScope.member && sessionScope.member.user_id == 'admin'}">
        <a href="/file/update?id=${board.id}" class="btn btn-edit">수정</a>
        <a href="javascript:void(0);" 
           onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='/file/delete?id=${board.id}'" 
           class="btn btn-delete">삭제</a>
    </c:if>
</div>
</body>
   <jsp:include page="/WEB-INF/views/footer.jsp" />

</html>