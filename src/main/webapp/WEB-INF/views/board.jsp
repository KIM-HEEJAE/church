<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>앨범 상세 보기</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<body>
<jsp:include page="header.jsp" />

    <h2>${board.b_title}</h2>
    <p>작성자: ${board.b_writer} | 작성일: ${board.b_date}</p>
    
    <div class="content-box">
        <img src="/img/${board.b_img}" style="max-width:500px;">
        <p>${board.b_content}</p>
    </div>

    <a href="/board/list">목록으로</a>
    
    <c:if test="${sessionScope.member.user_id == 'admin'}">
        <a href="/board/edit?b_no=${board.b_no}">수정</a>
        <a href="/board/delete?b_no=${board.b_no}">삭제</a>
    </c:if>
</body>
</html>