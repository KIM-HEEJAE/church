<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<body>
	<jsp:include page="header.jsp" />
	<div class="mypage-card">
    <div class="profile-img">
        <c:choose>
            <c:when test="${not empty dto.img}">
                <img src="/work/img/${dto.img}" width="150" height="150" style="border-radius: 50%; border: 3px solid #f0f0f0;">
            </c:when>
            <c:otherwise>
                <div style="width:150px; height:150px; background:#eee; border-radius:50%; margin: 0 auto; display:flex; align-items:center; justify-content:center;">이미지 없음</div>
            </c:otherwise>
        </c:choose>
    </div>

    <form action="/updateProfile" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>아이디</label>
            <input type="text" name="user_id" value="${dto.user_id}" readonly>
        </div>
        <div class="form-group">
            <label>이름</label>
            <input type="text" name="user_name" value="${dto.user_name}">
        </div>
        <div class="form-group">
            <label>이메일</label>
            <input type="email" name="email" value="${dto.email}">
        </div>
        <div class="form-group">
            <label>비밀번호 변경</label>
            <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="form-group">
            <label>프로필 사진</label>
            <input type="file" name="file">
        </div>
        
        <button type="submit" class="btn-submit">정보 수정하기</button>
    </form>
</div>
	
</body>
</html>