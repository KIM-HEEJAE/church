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
        <div style="text-align: right; margin-bottom: 10px;">
            <a href="/sermon/write"><button>설교 등록</button></a>
        </div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th width="10%">번호</th>
                <th width="50%">제목</th>
                <th width="20%">설교자</th>
                <th width="20%">날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="s" items="${list}">
                <tr>
                    <td>${s.s_no}</td>
                    <td style="text-align: left;"><a href="/sermon/view?s_no=${s.s_no}">${s.s_title}</a></td>
                    <td>${s.s_preacher}</td>
                    <td>${s.s_date}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="4">등록된 설교가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div> </body>
</html>