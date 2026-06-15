<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
    <jsp:include page="../header.jsp" />
<div class="grade-wrapper" style="max-width: 800px; margin: 20px auto;">
    <div class="grade-banner">
        <div class="banner-title">
            <h2>홍제감리교회 유치부</h2>
        </div>
        <div class="info-grid">
            <div class="info-item">대상: 유아유치</div>
            <div class="info-item">시간: 주일 오전 11시</div>
            <div class="info-item">장소: 지하 1층 유치부실</div>
        </div>
    </div>
    <div class="verse-section">
    <div class="box-left">
        <h2>유치부 말씀</h2>
        <div class="verse-text">
            "주의 말씀은 내 발에 등이요<br>
            내 길에 빛이니이다"
        </div>
        <div class="bible-ref">시편 119편 105절</div>
    </div>
    <div class="box-right">
        <h2>유치부 표어</h2>
        <div class="verse-text" style="font-size: 1.4em; font-weight: bold; padding-top: 20px;">
            거룩한 꿈을 꾸는<br>유치부
        </div>
    </div>
</div>
    <h3>유치부 조직</h3>
    <table class="org-table">
        <tr><td class="label">교장</td><td>박충섭 장로</td></tr>
        <tr><td class="label">담당교역자</td><td>신명찬 전도사</td></tr>
        <tr><td class="label">부장</td><td>박소연 권사</td></tr>
        <tr><td class="label">교사</td><td>심성희, 육예은, 김희훈, 김재현, 김준재, 육예림</td></tr>
    </table>
</div>
</body>
</html>