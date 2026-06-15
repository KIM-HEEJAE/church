<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주일 설교 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="container"> 
    <h1>주일 설교 목록</h1>

    <c:if test="${sessionScope.member.user_id == 'admin'}">
        <div style="text-align: right; margin-bottom: 20px;">
            <a href="/sermon/write"><button>설교 등록</button></a>
        </div>
    </c:if>

    <div class="sermon-list">
        <c:forEach var="s" items="${list}">
            <div class="sermon-item">
                <a href="/sermon/view?s_no=${s.s_no}" class="sermon-thumb">
    <c:choose>
        <%-- 영상 주소(S_VIDEO_URL)가 있을 경우 유튜브 썸네일 출력 --%>
        <c:when test="${not empty s.s_video_url}">
            <img src="https://img.youtube.com/vi/${s.s_video_url}/mqdefault.jpg" alt="썸네일">
        </c:when>
        <%-- 없을 경우 기본 이미지 --%>
        <c:otherwise>
            <img src="${pageContext.request.contextPath}/images/default_sermon.png" alt="기본 이미지">
        </c:otherwise>
    </c:choose>
</a>
                
                <div class="sermon-info">
                    <a href="/sermon/view?s_no=${s.s_no}" class="sermon-title">${s.s_title}</a>
                    <div class="sermon-meta">
                        설교자: ${s.s_preacher} | 날짜: ${s.s_date}
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty list}">
            <div style="text-align: center; padding: 50px; color: #888;">
                등록된 설교가 없습니다.
            </div>
        </c:if>
    </div>
    </div> 

</body>
</html>