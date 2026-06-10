<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교회 앨범</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        .album-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 20px; padding: 20px; }
        .card { border: 1px solid #ddd; border-radius: 15px; overflow: hidden; transition: 0.3s; background: #fff; text-align: center; padding-bottom: 10px; }
        .card:hover { transform: translateY(-10px); box-shadow: 0 10px 20px rgba(0,0,0,0.15); }
        .card img { width: 100%; height: 180px; object-fit: cover; border-bottom: 1px solid #eee; }
        .card h4 { margin: 10px 0; color: #333; }
        .btn-write { display: inline-block; padding: 10px 20px; background: #007bff; color: white; border-radius: 5px; text-decoration: none; margin-top: 20px; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" /> <h2 style="text-align: center; margin-top: 30px;">교회 앨범</h2>
    
    <div class="album-grid">
        <c:choose>
            <c:when test="${empty boardList}">
                <p style="text-align:center; width:100%;">등록된 게시글이 없습니다.</p>
            </c:when>
            <c:otherwise>
              
                <c:forEach var="board" items="${boardList}">
    <div class="card">
        <a href="/board/view?b_no=${board.b_no}" style="text-decoration:none;">
          
            <img src="/img/${board.thumbImg}" alt="앨범 이미지">
            <h4>${board.b_title}</h4>
        </a>
    </div>
</c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="pagination" style="text-align: center;">
        <a href="/board/list?curPage=${page.prevPage}">[이전]</a>
        <c:forEach begin="${page.blockStart}" end="${page.blockEnd}" var="idx">
            <a href="/board/list?curPage=${idx}">${idx}</a>
        </c:forEach>
        <a href="/board/list?curPage=${page.nextPage}">[다음]</a>
        
        <br><br>
        <c:if test="${not empty sessionScope.member && sessionScope.member.user_id == 'admin'}">
            <a href="/board/write" class="btn-write">글쓰기</a>
        </c:if>
    </div>
</body>
</html>