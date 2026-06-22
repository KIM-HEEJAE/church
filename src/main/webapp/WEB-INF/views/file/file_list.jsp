<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<jsp:include page="../header.jsp" />

	<div class="page-title-section"
		style="padding: 30px 0; text-align: center;">
		<h2>교회 주보 목록</h2>
	</div>

	<div class="board-container">
		<div class="btn-area" style="text-align: right; margin-bottom: 10px;">
			<c:if
				test="${not empty sessionScope.member && sessionScope.member.user_id == 'admin'}">
				<a href="/file/write" class="btn-write">주보 등록하기</a>

			</c:if>
		</div>

		<table class="board-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${boardList}">
					<tr>
						<td>${item.id}</td>
						<td><a href="/file/detail?id=${item.id}">${item.title}</a></td>
						<td>${item.regDate}</td>
						<td><a href="/file/detail?id=${item.id}">보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>