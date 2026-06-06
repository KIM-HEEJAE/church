<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>시설 안내</title>
<style>
    .hj-guide-wrapper { width: 100%; max-width: 1100px; margin: 40px auto; padding: 0 20px; box-sizing: border-box; }
    .hj-guide-tabs { display: grid; grid-template-columns: repeat(3, 1fr); border: 1px solid #ddd; margin-bottom: 20px; }
    .hj-guide-tab-btn { padding: 15px; border: none; cursor: pointer; background: #fff; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; font-weight: bold; }
    .hj-guide-tab-btn.hj-active { background: #1e5096; color: #fff; }
    .hj-guide-content-wrapper { display: none; gap: 30px; margin-top: 20px; }
    .hj-guide-content-wrapper.hj-active { display: flex; }
    .hj-guide-img-area { flex: 1.2; }
    .hj-guide-img-area img { width: 100%; display: block; margin-bottom: 10px; }
    .hj-guide-info-area { flex: 0.8; display: flex; flex-direction: column; gap: 8px; }
    .hj-guide-info-row { display: flex; border: 1px solid #eee; }
    .hj-guide-info-label { width: 120px; font-weight: bold; padding: 10px; text-align: center; background: #f4f4f4; flex-shrink: 0; }
    .hj-guide-info-text { padding: 10px; font-size: 14px; }
    .hj-guide-title-bar { font-size: 20px; font-weight: bold; margin: 20px 0; padding: 10px; border-left: 5px solid #1e5096; background: #f9f9f9; }
</style>
</head>
<body>
<div class="hj-guide-wrapper">
    <jsp:include page="../header.jsp" />

    <h2>시설 안내</h2>
    <div class="hj-guide-tabs">
        <button type="button" class="hj-guide-tab-btn hj-active" data-floor="all">전체</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="b2">B2</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="b1">B1</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="1f">1F</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="2f">2F</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="3f">3F</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="4f">4F</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="5f">5F</button>
        <button type="button" class="hj-guide-tab-btn" data-floor="6f">6F</button>
    </div>

    <div id="floorTitle" class="hj-guide-title-bar">전체 사역 공간 안내</div>

    <div id="content-all" class="hj-guide-content-wrapper hj-active">
        <div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/buildall.png" alt="전체"></div>
        <div class="hj-guide-info-area">
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">6F</div><div class="hj-guide-info-text">옥외 운동장</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">5F</div><div class="hj-guide-info-text">사택, 게스트하우스, 단체실</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">4F</div><div class="hj-guide-info-text">식당, 다목적실, 소그룹실, 성가대실, 여선교회매장</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">3F</div><div class="hj-guide-info-text">대예배실(중층), 유아실, 목양실, 사무실</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">2F</div><div class="hj-guide-info-text">대예배실, 기획위원회실, 새신자실, 재정부실</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">1F</div><div class="hj-guide-info-text">중예배실, 아동부실, 소그룹실, 봉사자실</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">B1</div><div class="hj-guide-info-text">유치부실, 놀이방, 카페, 주차장</div></div>
            <div class="hj-guide-info-row"><div class="hj-guide-info-label">B2</div><div class="hj-guide-info-text">소예배실, 세미나실, 소그룹실, 탁구실, 주차장</div></div>
        </div>
    </div>

    <div id="content-b2" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/buildb2.png" alt="B2"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">소예배실</div><div class="hj-guide-info-text">성도들의 소규모 예배 및 기도회 공간</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">세미나실</div><div class="hj-guide-info-text">교육 및 세미나용 시각 장비 완비</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">소그룹실</div><div class="hj-guide-info-text">구역 예배 및 성경 공부 모임 공간</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">탁구실</div><div class="hj-guide-info-text">성도 간 친목 및 체력 단련 시설</div></div></div></div>

    <div id="content-b1" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/buildb1.png" alt="B1"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">유치부실</div><div class="hj-guide-info-text">미취학 아동 교육 및 예배 공간</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">놀이방</div><div class="hj-guide-info-text">어린이용 친환경 놀이 시설</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">카페</div><div class="hj-guide-info-text">성도 교제 및 소통의 공간</div></div></div></div>

    <div id="content-1f" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/build1.png" alt="1F"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">중예배실</div><div class="hj-guide-info-text">중규모 예배 및 부서 집회실</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">아동부실</div><div class="hj-guide-info-text">초등부 신앙 교육 공간</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">소그룹실</div><div class="hj-guide-info-text">나눔과 기도를 위한 모임방</div></div></div></div>

    <div id="content-2f" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/build2.png" alt="2F"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">대예배실</div><div class="hj-guide-info-text">메인 성전</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">기획위원회실</div><div class="hj-guide-info-text">중직자 회의실</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">새신자실</div><div class="hj-guide-info-text">새신자 환영 및 정착 공간</div></div></div></div>

    <div id="content-3f" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/build3.png" alt="3F"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">대예배실(중층)</div><div class="hj-guide-info-text">복층 예배 좌석 공간</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">유아실</div><div class="hj-guide-info-text">영상 예배 및 부모 쉼터</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">목양실</div><div class="hj-guide-info-text">목사님 상담 및 집무 공간</div></div></div></div>

    <div id="content-4f" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/build4.png" alt="4F"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">식당</div><div class="hj-guide-info-text">전 성도 애찬 및 친교 식당</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">다목적실</div><div class="hj-guide-info-text">행사 및 멀티 문화 홀</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">성가대실</div><div class="hj-guide-info-text">찬양 연습 및 대기 공간</div></div></div></div>

    <div id="content-5f" class="hj-guide-content-wrapper"><div class="hj-guide-img-area" style="border: 2px dashed #ccc; display: flex; align-items: center; justify-content: center; font-weight: bold;">이미지 준비중</div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">사택</div><div class="hj-guide-info-text">목회자 가족 거주 공간</div></div><div class="hj-guide-info-row"><div class="hj-guide-info-label">게스트하우스</div><div class="hj-guide-info-text">방문 강사 및 선교사 숙소</div></div></div></div>

    <div id="content-6f" class="hj-guide-content-wrapper"><div class="hj-guide-img-area"><img src="${pageContext.request.contextPath}/images/build6.png" alt="6F"><img src="${pageContext.request.contextPath}/images/build6-1.png" alt="6F"></div><div class="hj-guide-info-area"><div class="hj-guide-info-row"><div class="hj-guide-info-label">옥외 운동장</div><div class="hj-guide-info-text">야외 체육 및 행사 공간</div></div></div></div>
</div>

<script>
    document.querySelectorAll('.hj-guide-tab-btn').forEach(button => {
        button.addEventListener('click', function() {
            document.querySelectorAll('.hj-guide-tab-btn').forEach(btn => btn.classList.remove('hj-active'));
            this.classList.add('hj-active');
            const target = this.getAttribute('data-floor');
            document.getElementById('floorTitle').innerText = (target === 'all' ? '전체 사역 공간 안내' : target.toUpperCase() + ' 사역 안내');
            document.querySelectorAll('.hj-guide-content-wrapper').forEach(c => c.classList.remove('hj-active'));
            document.getElementById('content-' + target).classList.add('hj-active');
        });
    });
</script>
</body>
</html>