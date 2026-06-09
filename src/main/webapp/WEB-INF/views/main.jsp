<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.church.homepage.dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍제감리교회</title>
<style>
   /* 기본 여백 리셋 */
    body, h1, ul, li, p {
        margin: 0;
        padding: 0;
    }

    /* 최상단 유틸바 스타일 */
    .top-util-bar {
        background-color: #1a1a1a;
        padding: 8px 50px;
        display: flex;
        justify-content: flex-end;
    }
    .util-menu { display: flex; gap: 20px; align-items: center; }
    .util-menu a { color: #ffffff; text-decoration: none; font-size: 13px; opacity: 0.8; }
    .util-menu a:hover { opacity: 1; }
    .welcome-text { color: #ffffff; font-size: 13px; font-weight: bold; margin-right: 5px; }
    .btn-logout { color: #ff6b6b !important; }

    /* 메인 헤더 전체 영역 */
    .main-header-container {
        background-color: #222222;
        border-bottom: 1px solid #333333;
        padding: 0 50px; 
        height: 120px;    
        box-sizing: border-box;
    }

    /* 로고와 메뉴를 가로로 한 줄 배치하는 핵심 상자 */
    .header-main-content {
        display: flex;
        justify-content: space-between;
        align-items: center;   
        max-width: 1400px;     
        margin: 0 auto;        
        height: 100%;    
    }

    /* 로고 영역 스타일 */
    .logo-area {
        display: flex;
        align-items: center;
        gap: 15px;
        height: 100%;          
        max-height: 120px;  
        overflow: hidden;   
    }
    .logo-img { height: 100%; max-height: 110px; width: auto; object-fit: contain; }
    .logo-text { display: flex; flex-direction: column; justify-content: center; }
    .title-ko { font-size: 24px; font-weight: bold; color: #ffffff; letter-spacing: 1px; line-height: 1.2; }
    .title-en { font-size: 11px; color: #aaaaaa; font-family: Arial, sans-serif; margin-top: 4px; }

    /* 네비게이션 바 전체 높이를 부모와 맞춰 마우스 인식 범위를 넓힙니다 */
    .navbar-container {
        height: 100%;
    }

    .nav-menu { 
        display: flex; 
        list-style: none; 
        gap: 35px; 
        height: 100%;
        align-items: center;
    }
    
    /* 대메뉴 각 항목이 헤더 전체 세로 높이(100%)를 차지하게 하여 빈틈을 제거합니다 */
    .nav-menu > li {
        position: relative;
        height: 100%;
        display: flex;
        align-items: center;
    }
    
    .nav-menu > li > a {
        color: #ffffff;
        text-decoration: none;
        font-size: 18px;
        font-weight: bold;
        transition: color 0.2s;
        display: block;
        padding: 20px 0; 
    }
    .nav-menu > li > a:hover { color: #cccccc; }

    /* 서브 메뉴 드롭다운 위치 및 유격 완벽 보정 */
    .submenu {
        display: none;             
        position: absolute;        
        top: 100%;                 
        left: 50%;
        transform: translateX(-50%); 
        background-color: #2b2b2b; 
        min-width: 160px;          
        list-style: none;
        padding: 5px 0;
        border-radius: 0 0 4px 4px; 
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        z-index: 999;              
    }

    /* 서브 메뉴 안의 한 줄씩(항목) 디자인 */
    .submenu li a {
        display: block;
        padding: 12px 20px;        
        color: #dddddd;
        text-decoration: none;
        font-size: 14px;
        font-weight: normal;
        text-align: center;
        white-space: nowrap;       
        transition: background 0.2s, color 0.2s;
    }

    .submenu li a:hover {
        background-color: #444444;
        color: #ffffff;
    }

    .nav-menu .dropdown-item:hover .submenu {
        display: block;
    }

    /* 💡 [추가] 슬라이더 전체 상자의 크기 스타일 */
    .slider-container {
        position: relative;
        width: 100%;
        height: 500px; /* 👈 슬라이드가 노출될 세로 높이 크기 지정 (원하시는 대로 조절 가능) */
        overflow: hidden;
        background-color: #000;
    }

    /* 💡 [추가] 개별 슬라이드 이미지 정렬 스타일 */
    .slide {
        position: absolute;
        top: 0; left: 0;
        width: 100%; height: 100%;
        opacity: 0;
        transition: opacity 1s ease-in-out; /* 1초 동안 부드럽게 페이드인/아웃 */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .slide.active {
        opacity: 1; /* 활성화된 이미지만 보이게 설정 */
    }
    /* 💡 [신규] 맨 하단 카피라이트 푸터 영역 스타일 */
    .main-footer {
        background-color: #2a2a2a; /* 보내주신 사진 느낌의 어두운 회그레이 색상 */
        color: #888888;
        padding: 35px 50px;
        font-size: 14px;
        border-top: 1px solid #1a1a1a;
        margin-top: 0; /* 슬라이더 바로 밑에 빈틈없이 밀착 */
    }
    .footer-content {
        max-width: 1400px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .footer-left .footer-info {
        margin-bottom: 8px;
        color: #aaaaaa;
    }
    .footer-left .footer-info span { 
        margin-right: 15px; 
    }
    .footer-copyright { 
        font-size: 13px; 
        color: #666666; 
    }
    .footer-right {
        display: flex;
        gap: 20px;
    }
    .footer-right a {
        color: #888888; 
        text-decoration: none; 
        font-size: 13px;
        transition: color 0.2s;
    }
    .footer-right a:hover { 
        color: #ffffff; /* 마우스 올리면 하얗게 하이라이트 */
    }
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    

    <div class="slider-container">
        <div class="slide active" style="background-image: url('/images/slide1.png');"></div>
        
        <div class="slide" style="background-image: url('/images/slide2.png');"></div>
    </div>
<footer class="main-footer">
        <div class="footer-content">
            <div class="footer-left">
                <div class="footer-info">
                    <strong>홍제감리교회</strong>
                    <span> | 서울특별시 서대문구 세무서길 28(홍제동)</span>
                    <span>전화: 02-391-4560</span> </div>
                <p class="footer-copyright">
                    Copyright © 2024 홍제감리교회. All right reserved. Powered by 김희재.
                </p>
            </div>
            <div class="footer-right">
                <a href="#none">🔒 개인정보처리방침</a>
                <a href="#none">이메일무단수집거부</a>
            </div>
        </div>
    </footer>
    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');

        function nextSlide() {
            // 현재 슬라이드 안 보이게 처리
            slides[currentSlide].classList.remove('active');
            // 다음 슬라이드 인덱스 계산
            currentSlide = (currentSlide + 1) % slides.length;
            // 다음 슬라이드 보이게 처리
            slides[currentSlide].classList.add('active');
        }

        setInterval(nextSlide, 3000);
    </script>
    <script>
    // 컨트롤러에서 전달받은 msg가 있다면 alert창을 띄움
    <c:if test="${not empty msg}">
        alert("${msg}");
    </c:if>
</script>
</body>
</html>