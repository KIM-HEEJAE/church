<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<body>
<jsp:include page="header.jsp" />
<div class="mypage-container" style="padding: 20px;">
    <div class="profile-img">
        <c:choose>
            <c:when test="${not empty dto.img}">
                <img src="/work/img/${dto.img}" width="150" height="150" style="border-radius: 50%; border: 1px solid #ccc;">
            </c:when>

        </c:choose>
    </div>

    <form action="/updateProfile" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
        <p>아이디: <input type="text" name="user_id" value="${dto.user_id}" readonly></p>
        <p>이름: <input type="text" name="user_name" value="${dto.user_name}"></p>
        <p>이메일: <input type="email" name="email" value="${dto.email}"></p>
        <p>프로필 사진 변경: <input type="file" name="file"></p>
        <button type="submit">정보 및 사진 수정하기</button>
    </form>
</div>
</body>
</html>