<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예배시간 - 홍제감리교회</title>
<style>
    /* 기본 여백 리셋 */
    body, h1, h2, h3, ul, li, p, table, th, td { 
        margin: 0; 
        padding: 0; 
    }

    /* 메인 화면 레이아웃 스타일 유지 (헤더/유틸바 깨짐 방지) */
    .top-util-bar { background-color: #1a1a1a; padding: 8px 50px; display: flex; justify-content: flex-end; }
    .util-menu { display: flex; gap: 20px; align-items: center; }
    .util-menu a { color: #ffffff; text-decoration: none; font-size: 13px; opacity: 0.8; }
    .util-menu a:hover { opacity: 1; }
    .welcome-text { color: #ffffff; font-size: 13px; font-weight: bold; margin-right: 5px; }
    .btn-logout { color: #ff6b6b !important; }
    .main-header-container { background-color: #222222; border-bottom: 1px solid #333333; padding: 0 50px; height: 120px; box-sizing: border-box; }
    .header-main-content { display: flex; justify-content: space-between; align-items: center; max-width: 1400px; margin: 0 auto; height: 100%; }
    .navbar-container { height: 100%; }
    .nav-menu { display: flex; list-style: none; gap: 35px; height: 100%; align-items: center; }
    .nav-menu > li { position: relative; height: 100%; display: flex; align-items: center; }
    .nav-menu > li > a { color: #ffffff; text-decoration: none; font-size: 18px; font-weight: bold; display: block; padding: 20px 0; }
    .nav-menu > li > a:hover { color: #cccccc; }
    .submenu { display: none; position: absolute; top: 100%; left: 50%; transform: translateX(-50%); background-color: #2b2b2b; min-width: 160px; list-style: none; padding: 5px 0; border-radius: 0 0 4px 4px; box-shadow: 0 4px 10px rgba(0,0,0,0.3); z-index: 999; }
    .submenu li a { display: block; padding: 12px 20px; color: #dddddd; text-decoration: none; font-size: 14px; text-align: center; white-space: nowrap; }
    .submenu li a:hover { background-color: #444444; color: #ffffff; }
    .nav-menu .dropdown-item:hover .submenu { display: block; }
    .logo-area { display: flex; align-items: center; gap: 15px; height: 100%; max-height: 120px; overflow: hidden; }
    .logo-img { height: 100%; max-height: 110px; width: auto; object-fit: contain; }
    .logo-text { display: flex; flex-direction: column; justify-content: center; }
    .title-ko { font-size: 24px; font-weight: bold; color: #ffffff; letter-spacing: 1px; line-height: 1.2; }
    .title-en { font-size: 11px; color: #aaaaaa; font-family: Arial, sans-serif; margin-top: 4px; }

    /* 📄 예배시간 본문 영역 전체 레이아웃 스타일 */
    .content-container {
        max-width: 1000px;
        margin: 60px auto;
        padding: 0 20px;
        box-sizing: border-box;
    }
    
    /* 왼쪽 아래 제목 스타일 */
    .page-title {
        font-size: 28px;
        font-weight: bold;
        color: #222222;
        border-bottom: 2px solid #333333;
        padding-bottom: 15px;
        margin-bottom: 40px;
        letter-spacing: -0.5px;
    }

    /* 각 섹션(주일예배, 주간모임, 교회학교) 타이틀 스타일 */
    .section-title {
        font-size: 20px;
        font-weight: bold;
        color: #333333;
        margin-top: 45px;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    /* 표(Table) 기본 레이아웃 스타일 */
    .time-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        font-size: 15px;
        text-align: center;
        background-color: #ffffff;
    }

    /* 테이블 헤더 (구분, 시간, 장소) */
    .time-table th {
        padding: 14px;
        font-weight: bold;
        color: #333333;
        border-top: 2px solid #ccc;
        border-bottom: 1px solid #ddd;
    }

    /* 1. 주일예배, 교회학교 섹션용 헤더 컬러 (은은한 푸른빛) */
    .bg-blue th {
        background-color: #ebf3f9;
    }

    /* 2. 주간모임 섹션용 헤더 컬러 (은은한 회색빛) */
    .bg-gray th {
        background-color: #edebe4;
    }

    /* 테이블 본문 행 스타일 */
    .time-table td {
        padding: 14px;
        border-bottom: 1px solid #e9e9e9;
        color: #555555;
        white-space: nowrap; /* 글자 자동 줄바꿈 방지 */
    }

    /* 첫 번째 컬럼(구분) 중에서 세로 병합(rowspan) 구간 좌측 연한 하늘색 배경 */
    .time-table td.main-category {
        background-color: #f4f9fc;
        font-weight: bold;
        color: #333333;
        border-right: 1px solid #e9e9e9;
    }

    /* 마우스 올렸을 때 행 하이라이트 반응형 효과 */
    .time-table tbody tr:hover td {
        background-color: #fcfcfc;
    }
    .time-table tbody tr:hover td.main-category {
        background-color: #f4f9fc; /* 왼쪽 병합 셀은 하이라이트 제외 */
    }

    /* 푸터 스타일 고정 */
    .main-footer { background-color: #2a2a2a; color: #888888; padding: 35px 50px; font-size: 14px; border-top: 1px solid #1a1a1a; margin-top: 120px; }
    .footer-content { max-width: 1400px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; }
    .footer-left .footer-info { margin-bottom: 8px; color: #aaaaaa; }
    .footer-left .footer-info span { margin-right: 15px; }
    .footer-copyright { font-size: 13px; color: #666666; }
    .footer-right { display: flex; gap: 20px; }
    .footer-right a { color: #888888; text-decoration: none; font-size: 13px; }
</style>
</head>
<body>

    <jsp:include page="../header.jsp" />

    <div class="content-container">
        <h2 class="page-title">예배시간</h2>
        
        <h3 class="section-title">주일예배</h3>
        <table class="time-table bg-blue">
            <thead>
                <tr>
                    <th style="width: 30%;">구 분</th>
                    <th style="width: 40%;">시 간</th>
                    <th style="width: 30%;">장 소</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="3" class="main-category">주일예배</td>
                    <td>1부 : 주일 오전 9:00</td>
                    <td>2층 대예배실</td>
                </tr>
                <tr>
                    <td>2부 : 주일 오전 11:00</td>
                    <td>2층 대예배실</td>
                </tr>
                <tr>
                    <td>오후예배 : 매월 마지막 주일 오후 2:00</td>
                    <td>2층 대예배실</td>
                </tr>
            </tbody>
        </table>

        <h3 class="section-title">주간모임</h3>
        <table class="time-table bg-gray">
            <thead>
                <tr>
                    <th style="width: 30%;">구 분</th>
                    <th style="width: 40%;">시 간</th>
                    <th style="width: 30%;">장 소</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="font-weight: bold; color: #333;">수요예배</td>
                    <td>오후 7:30</td>
                    <td>1층 중예배실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">새벽기도회</td>
                    <td>월~금 오전 5:30</td>
                    <td>1층 중예배실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">토요기도회</td>
                    <td>오전 9:30</td>
                    <td>지하 2층 소예배실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">속회</td>
                    <td>주 중</td>
                    <td>가정 및 교회</td>
                </tr>
            </tbody>
        </table>

        <h3 class="section-title">교회학교</h3>
        <table class="time-table bg-blue">
            <thead>
                <tr>
                    <th style="width: 30%;">구 분</th>
                    <th style="width: 40%;">시 간</th>
                    <th style="width: 30%;">장 소</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="font-weight: bold; color: #333;">영유아부</td>
                    <td>주일 오전 11:00</td>
                    <td>3층 유아부실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">유치부</td>
                    <td>주일 오전 11:00</td>
                    <td>지하 1층 유치부실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">아동부</td>
                    <td>주일 오전 11:00</td>
                    <td>1층 아동부실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">학생부</td>
                    <td>주일 오전 11:00</td>
                    <td>지하 2층 소예배실</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; color: #333;">청년부</td>
                    <td>주일 오후 2:00</td>
                    <td>1층 중예배실</td>
                </tr>
            </tbody>
        </table>
    </div>

    <footer class="main-footer">
        <div class="footer-content">
            <div class="footer-left">
                <div class="footer-info">
                    <strong>홍제감리교회</strong>
                    <span> | 서울특별시 서대문구 세무서길 28(홍제동)</span>
                    <span>전화: 02-391-4560</span>
                </div>
                <p class="footer-copyright">
                    Copyright © 2024 홍제감리교회. All right reserved. Powered by 웹치치.
                </p>
            </div>
            <div class="footer-right">
                <a href="#none">🔒 개인정보처리방침</a>
                <a href="#none">이메일무단수집거부</a>
            </div>
        </div>
    </footer>

</body>
</html>