<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
    <jsp:include page="../header.jsp" />
<div class="grade-wrapper" style="max-width: 800px; margin: 20px auto;">
    <div class="grade-banner">
        <div class="banner-title">
            <h2>홍제감리교회 학생부</h2>
        </div>
        <div class="info-grid">
            <div class="info-item">대상: 학생</div>
            <div class="info-item">시간: 주일 오전 11시</div>
            <div class="info-item">장소: 지하2층 소예배실</div>
        </div>
    </div>
    
    <h3>학생부 조직</h3>
    <table class="org-table">
        <tr><td class="label">교장</td><td>박충섭 장로</td></tr>
        <tr><td class="label">담당교역자</td><td>여혜민 목사</td></tr>
        <tr><td class="label">부장</td><td>정희용 집사</td></tr>
        <tr><td class="label">교사</td><td>현규석 김병준 최사라 강주희</td></tr>
    </table>
</div>
</body>
</html>