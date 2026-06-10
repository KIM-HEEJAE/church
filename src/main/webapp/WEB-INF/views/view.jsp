<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${board.b_title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .board-container { max-width: 800px; margin: 40px auto; padding: 20px; background: #fff; box-shadow: 0 4px 15px rgba(0,0,0,0.1); border-radius: 12px; }
        .content-box { margin: 20px 0; line-height: 1.6; }
        .content-box img { display: block; margin: 0 auto 20px; border-radius: 8px; max-width: 500px; }
        .btn-group { margin-top: 30px; text-align: right; }
        .btn { padding: 10px 20px; text-decoration: none; border-radius: 6px; font-weight: bold; margin-left: 10px; }
        .btn-list { background: #6c757d; color: #fff; }
        .btn-edit { background: #007bff; color: #fff; }
        .btn-delete { background: #dc3545; color: #fff; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="board-container">
        <h2>${board.b_title}</h2>
        <p>작성자: ${board.b_writer} | 작성일: ${board.b_date}</p>
        
        <div class="content-box">
            <%-- 이미지 리스트 출력 --%>
            <c:forEach var="imgName" items="${imgList}">
                <img src="/img/${imgName}" alt="게시글 이미지">
            </c:forEach>
            
            <p>${board.b_content}</p>
        </div>

        <div class="btn-group">
            <a href="/board/list" class="btn btn-list">목록으로</a>
            
            <%-- 관리자일 때만 수정/삭제 버튼 노출 --%>
            <c:if test="${not empty sessionScope.member && sessionScope.member.user_id == 'admin'}">
                <a href="/board/edit?b_no=${board.b_no}" class="btn btn-edit">수정</a>
                <a href="/board/delete?b_no=${board.b_no}" class="btn btn-delete">삭제</a>
            </c:if>
        </div>
    </div>
</body>
</html>