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
            <h2>홍제감리교회 청년부</h2>
        </div>
        <div class="info-grid">
            <div class="info-item">대상: 청년</div>
            <div class="info-item">시간: 주일 오후 2시</div>
            <div class="info-item">장소: 1층 중예배실</div>
        </div>
    </div>
    <div class="verse-section">
    <div class="box-left">
        <h2>청년부 말씀</h2>
        <div class="verse-text">
            "하나님이 말씀하시기를<br>
            말세에 내가 내 영을 모든 육체에 부어 주리니 너희의 자녀들은 예언할 것이요 너희의 젊은이들은 환상을 보고 너희의 늙은이들은 꿈을 꾸리라"
        </div>
        <div class="bible-ref"> 사도행전 2장 17절

</div>
    </div>
    <div class="box-right">
        <h2>청년부 표어</h2>
        <div class="verse-text" style="font-size: 1.4em; font-weight: bold; padding-top: 20px;">
            거룩한 꿈을 꾸는<br>젊은 세대
        </div>
    </div>
</div>
    <h3>청년부 조직</h3>
    <table class="org-table">
        <tr><td class="label">교장</td><td>박충섭 장로</td></tr>
        <tr><td class="label">담당교역자</td><td>이초현 목사</td></tr>
        <tr><td class="label">부장</td><td>육승범 권사</td></tr>
        <tr><td class="label">임원</td><td>회장: 황승우<br> 부회장: 김규현<br> 총무: 김미선<br> 회계: 박승윤<br> 서기: 육예은</td></tr>
    </table>
</div>
</body>
   <jsp:include page="/WEB-INF/views/footer.jsp" />

</html>