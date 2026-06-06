<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬기는 분들 - 홍제감리교회</title>
<style>
    /* 기본 여백 리셋 */
    body, h1, h2, h3, ul, li, p { 
        margin: 0; 
        padding: 0; 
    }

    /* 메인 화면 레이아웃 스타일 유지 */
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

    /* 본문 영역 레이아웃 스타일 */
    .content-container {
        max-width: 1000px;
        margin: 60px auto;
        padding: 0 20px;
        box-sizing: border-box;
    }
    
    .page-title {
        font-size: 28px;
        font-weight: bold;
        color: #222222;
        border-bottom: 2px solid #333333;
        padding-bottom: 15px;
        margin-bottom: 40px;
        letter-spacing: -0.5px;
    }

    /* 직급 구분을 위한 섹션 타이틀 공통 스타일 */
    .role-section-title {
        font-size: 24px;
        font-weight: bold;
        color: #333333;
        margin-top: 55px;
        margin-bottom: 20px;
        padding-left: 5px;
        border-left: 4px solid #1e5096; /* 섹션 왼쪽에 포인트를 주는 네이비 선 */
    }

    /* 프로필 카드 구조 스타일 */
    .profile-card {
        background-color: #ffffff;
        border: 1px solid #dddddd;
        border-radius: 4px;
        padding: 30px;
        display: flex;
        gap: 35px;
        margin-bottom: 25px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.02);
    }

    /* 프로필 이미지 규격 통일 (160x200) */
    .profile-img-box img {
        width: 160px;
        height: 200px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #eee;
    }

    .profile-info-box {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
    }

    .profile-name {
        font-size: 20px;
        font-weight: bold;
        color: #222222;
        margin-bottom: 18px;
    }
    .profile-name span {
        font-size: 18px;
        font-weight: normal;
        color: #1e5096;
        margin-left: 8px;
    }

    .info-row {
        margin-bottom: 12px;
        line-height: 1.6;
        font-size: 15px;
        color: #555555;
    }

    .info-label {
        font-weight: bold;
        color: #333333;
        display: flex;
        align-items: center;
        gap: 6px;
        margin-bottom: 4px;
    }
    
    .info-details {
        color: #666666;
        padding-left: 4px;
        word-break: keep-all;
    }

    /* 푸터 스타일 */
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
        <h2 class="page-title">섬기는 분들</h2>
        
        <!-- ================================================================= -->
        <!-- 👑 [섹션 1] 담임목사 -->
        <!-- ================================================================= -->
        <h3 class="role-section-title">담임목사</h3>
        
        <!-- 1. 정대경 담임목사님 (pastor_img02) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/pastor_img02.jpg" alt="정대경 담임목사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">정대령 <span>담임목사</span></div>
                <div class="info-row">
                    <div class="info-label">🎓 소개</div>
                    <div class="info-details">
                        감리교신학대학교 졸업<br>
                        연세대학교 연합신학대학원 졸업(신학석사)<br>
                        미국 SAN FRANCISCO CHRISTIAN UNIVERSITY & SEMINARY 졸업(신학박사)
                    </div>
                </div>
            </div>
        </div>


        <!-- ================================================================= -->
        <!-- ⛪ [섹션 2] 부목사 -->
        <!-- ================================================================= -->
        <h3 class="role-section-title">부목사</h3>
        
        <!-- 2. 부목사님 (pastor_img03) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/pastor_img03.jpg" alt="이종석 목사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">이종석 <span>목사</span></div>
                <div class="info-row" style="margin-bottom: 15px;">
                    <div class="info-label">⛪ 2교구 / 청장년부</div>
                </div>
                <div class="info-row">
                    <div class="info-label">🎓 소개</div>
                    <div class="info-details">
                        감리교신학대학교 / 신학대학원 졸업
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. 부목사님 (pastor_img04) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/pastor_img04.jpg" alt="이초현 목사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">이초현 <span>목사</span></div>
                <div class="info-row" style="margin-bottom: 15px;">
                    <div class="info-label">⛪ 1교구 / 청년부</div>
                </div>
                <div class="info-row">
                    <div class="info-label">🎓 소개</div>
                    <div class="info-details">
                        감리교신학대학교 / 신학대학원 졸업
                    </div>
                </div>
            </div>
        </div>

        <!-- 4. 부목사님 (pastor_img05) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/pastor_img05.jpg" alt="목사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">여혜민 <span>목사</span></div> <!-- 💡 성함 및 담당 부서 수정 필요 -->
                <div class="info-row" style="margin-bottom: 15px;">
                    <div class="info-label">⛪ 학생부</div>
                </div>
                <div class="info-row">
                    <div class="info-label">🎓 소개</div>
                    <div class="info-details">
                        감리교신학대학원 졸업
                    </div>
                </div>
            </div>
        </div>


        <h3 class="role-section-title">전도사 / 교육전도사</h3>

        <!-- 5. 전도사님 (hyunsul_img01) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/hyunsul_img01.jpg" alt="전도사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">박현설 <span>전도사</span></div> <!-- 💡 파일명 기반 임시 성함 매칭 -->
                <div class="info-row" style="margin-bottom: 15px;">
                    <div class="info-label">⛪ 아동부</div>
                </div>
               
            </div>
        </div>

        <!-- 6. 전도사님 (jisoo_img01) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/jisoo_img01.jpg" alt="전도사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">이지수 <span>전도사</span></div> <!-- 💡 파일명 기반 임시 성함 매칭 -->
                <div class="info-row" style="margin-bottom: 15px;">
                    <div class="info-label">⛪ 심방</div>
                </div>
               
            </div>
        </div>

        <!-- 7. 전도사님 (myeongchan_img01) -->
        <div class="profile-card">
            <div class="profile-img-box">
                <img src="/images/myeongchan_img01.jpg" alt="전도사">
            </div>
            <div class="profile-info-box">
                <div class="profile-name">신명찬 <span>전도사</span></div> <!-- 💡 파일명 기반 임시 성함 매칭 -->
                <div class="info-row" style="margin-bottom: 15px;">
                    <div class="info-label">⛪ 유치부</div>
                </div>
                
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