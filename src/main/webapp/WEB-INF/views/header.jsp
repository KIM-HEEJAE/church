<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.church.homepage.dto.MemberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="top-util-bar">
    <div class="util-menu">
        <%
            MemberDTO loginMember = (MemberDTO) session.getAttribute("member");
        %>

        <% if(loginMember == null) { %>
            <a href="/login">로그인</a>
            <a href="/join">회원가입</a>
        <% } else { %>
            <span class="welcome-text">
                🎉 <%= loginMember.getUser_name() %>님 환영합니다!
            </span>
            <a href="/logout" class="btn-logout">로그아웃</a>
        <% } %>
			<a href="/mypage" class="mypage">마이페이지</a>
        <a href="#none">문자</a>
        <a href="#none">카페</a>
        <a href="#none">일정</a>
    </div>
</div>

<header class="main-header-container">
    <div class="header-main-content">
        
        <div class="logo-area" onclick="location.href='/'" style="cursor: pointer;">
            <img src="/images/logo.png" alt="홍제감리교회 로고" class="logo-img">
            <div class="logo-text">
                <span class="title-ko">홍제감리교회</span>
                <span class="title-en">HONG JE METHODIST CHURCH</span>
            </div>
        </div>
        
        <nav class="navbar-container">
            <ul class="nav-menu">
                <!-- 1. 교회소개 대메뉴 클릭 시 -> /intro/greeting(담임목사인사말)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/greeting">교회소개</a>
                    <ul class="submenu">
                        <li><a href="/intro/hi">담임목사인사말</a></li>
                        <li><a href="/intro/time">예배시간</a></li>
                        <li><a href="/intro/people">섬기는분들</a></li>
                        <li><a href="/intro/history">교회연혁</a></li>
                        <li><a href="/intro/guide">교회시설안내</a></li>
                        <li><a href="/intro/location">오시는길</a></li>
                    </ul>
                </li>
                <!-- 2. 말씀과찬양 대메뉴 클릭 시 -> /intro/time(주일설교)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/time">말씀과찬양</a>
                    <ul class="submenu">
                        <li><a href="/intro/time">주일설교</a></li>
                        <li><a href="/intro/people">행사영상</a></li>
                    </ul>
                </li>
                <!-- 3. 선교회 대메뉴 클릭 시 -> /intro/sunkyo(선교회)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/sunkyo">선교회</a>
                    <ul class="submenu">
                        <li><a href="/intro/sunkyo">선교회</a></li>
                    </ul>
                </li>
                <!-- 4. 교회학교 대메뉴 클릭 시 -> /intro/grade(유치부)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/grade">교회학교</a>
                    <ul class="submenu">
                        <li><a href="/intro/young">유치부</a></li>
                        <li><a href="/intro/child">아동부</a></li>
                        <li><a href="/intro/student">학생부</a></li>
                        <li><a href="/intro/adult">청년부</a></li>                              
                    </ul>
                </li>
                <!-- 5. 찬양대 대메뉴 클릭 시 -> /intro/choir(찬양대 안내)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/choir">찬양대</a>
                    <ul class="submenu">
                        <li><a href="/intro/choir">찬양대 안내</a></li>
                        <li><a href="/intro/grade">글로리아 성가대</a></li>
                        <li><a href="/intro/grade">할렐루야 성가대</a></li>
                        <li><a href="/intro/grade">늘찬양 성가대</a></li>   
                    </ul>
                </li>
                <!-- 6. 교회앨범 대메뉴 클릭 시 -> /intro/album(교회 앨범)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/album">교회앨범</a>
                    <ul class="submenu">
                        <li><a href="/intro/album">교회 앨범</a></li>
                    </ul>
                </li>
                <!-- 7. 교회소식 대메뉴 클릭 시 -> /intro/news(교회 소식)로 변경 -->
                <li class="dropdown-item">
                    <a href="/intro/news">교회소식</a>
                    <ul class="submenu">
                        <li><a href="/intro/news">교회 소식</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
    </div>
</header>