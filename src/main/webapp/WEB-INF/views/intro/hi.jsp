<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담임목사인사말 - 홍제감리교회</title>
<style>
    /* 기본 여백 리셋 */
    body, h1, ul, li, p { 
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

    /* 💡 [신규] 인사말 본문 영역 레이아웃 스타일 */
    .content-container {
        max-width: 1100px;
        margin: 60px auto;
        padding: 0 40px;
        box-sizing: border-box;
    }
    
    /* 헤더 왼쪽 아래쪽에 배치될 큰 제목 */
    .page-title {
        font-size: 28px;
        font-weight: bold;
        color: #222222;
        border-bottom: 2px solid #333333;
        padding-bottom: 15px;
        margin-bottom: 40px;
        letter-spacing: -0.5px;
    }
    
    /* 사진과 글씨를 가로 배치하기 위한 상자 */
    .greeting-flex-box {
        display: flex;
        gap: 50px;            /* 사진과 우측 글씨 사이의 간격 */
        align-items: flex-start;
    }
    
    /* 목사님 사진 스타일 */
    .pastor-photo-box img {
        width: 320px;         /* 사진 가로 크기 지정 */
        height: auto;
        border-radius: 4px;   /* 모서리 살짝 부드럽게 */
        box-shadow: 0 4px 15px rgba(0,0,0,0.1); /* 은은한 그림자 효과 */
    }
    
    /* 오른쪽 본문 텍스트 정렬 스타일 */
    .greeting-text-box {
        flex: 1;              /* 남은 가로 공간을 꽉 채움 */
        line-height: 1.9;     /* 줄간격을 여유 있게 배치 */
        color: #444444;       /* 본문 글씨색 */
        font-size: 16px;
    }
    
    /* 💡 강조 문구 (크게 + 초록색) 스타일 */
    .highlight-welcome {
        font-size: 26px;      /* 다른 글씨보다 크게 설정 */
        font-weight: bold;
        color: #2e7d32;       /* 💡 신뢰감을 주는 차분한 교회 톤의 초록색 */
        line-height: 1.4;
        margin-bottom: 30px;  /* 강조 문구와 아래 본문 사이의 간격 */
    }
    
    /* 일반 문단 간의 간격 조정 */
    .greeting-text-box p {
        margin-bottom: 18px;
        word-break: keep-all; /* 한글 단어가 중간에 끊기지 않고 줄바꿈되도록 설정 */
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
        <h2 class="page-title">담임목사 인사말</h2>
        
        <div class="greeting-flex-box">
            
            <div class="pastor-photo-box">
                <img src="/images/pastor_img01.jpg" alt="홍제감리교회 담임목사">
            </div>
            
            <div class="greeting-text-box">
                <div class="highlight-welcome">
                    '홍제감리교회'에 오신<br>
                    여러분을 환영합니다.
                </div>
                
                <p>홍제감리교회는 하나님께서 1921년 서대문구 홍제동에 하나님의 역사를 위해 세우신 교회입니다.</p>
                <p>그동안 많은 신앙의 선배님들이 이 제단을 통하여 예수님의 제자가 되어 이 세상에서 빛과 소금의 역할을 감당하셨습니다.</p>
                <p>저희 교회는 그 전통을 이어받아, 무엇보다 예수님을 닮아가며 진정한 예수님의 제자들로 거듭나기를 소망하는 공동체입니다.</p>
                <p>또한 다음 세대들에게 예수 그리스도를 전하여 하나님께서 귀하게 사용하시는 사명자들로 세우는 일에 최선을 다하고 있습니다.</p>
                <p>앞으로도 예수 그리스도의 복음을 위하여 말씀 안에서 하나가 되어 전도하고 기도하며 이 세상에서 빛과 소금의 역할을 감당하기 위해 열심히 달려 나가려고 합니다.</p>
                <p style="margin-top: 30px; font-weight: bold;">이 공동체에 여러분을 초대합니다.</p>
            </div>
            
        </div>
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