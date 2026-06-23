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
    <div class="verse-section">
    <div class="box-left">
        <h2>학생부 말씀</h2>
        <div class="verse-text">
            "하나님이 말씀하시기를<br>

 말세에 내가 내 영을 모든 육체에 부어 주리니

 너희의 자녀들은 예언할 것이요

 너희의 젊은이들은 환상을 보고

 너희의 늙은이들은 꿈을 꾸리라"
        </div>
        <div class="bible-ref"> 사도행전 2장 17절
</div>
    </div>
    <div class="box-right">
        <h2>학생부 표어</h2>
        <div class="verse-text" style="font-size: 1.4em; font-weight: bold; padding-top: 20px;">
            거룩한 꿈을 꾸는<br>학생부
        </div>
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
   <jsp:include page="/WEB-INF/views/footer.jsp" />

</html>