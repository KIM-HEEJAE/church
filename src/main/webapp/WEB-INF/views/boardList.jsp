<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교회 앨범 게시판</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<body>
<jsp:include page="header.jsp" />

    <h2>교회 앨범</h2>
    
    <div class="album-container">
        <c:choose>
            <c:when test="${empty boardList}">
                <p>등록된 게시글이 없습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="board" items="${boardList}">
                    <div class="card" style="border:1px solid #ccc; margin:10px; padding:10px; width:200px;">
                        <a href="/board/view?b_no=${board.b_no}">
                            <img src="/img/${board.b_img}" style="width:100%">
                            <h4>${board.b_title}</h4>
                        </a>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="pagination">
        <a href="/board/list?curPage=${page.prevPage}">[이전]</a>
        
        <c:forEach begin="${page.blockStart}" end="${page.blockEnd}" var="idx">
            <a href="/board/list?curPage=${idx}">${idx}</a>
        </c:forEach>
        <c:if test="${sessionScope.member.user_id == 1}">
    <a href="/board/write" style="padding:10px; background:blue; color:white; text-decoration:none;">글쓰기</a>
</c:if>
        <a href="/board/list?curPage=${page.nextPage}">[다음]</a>
    </div>
</body>
</html>