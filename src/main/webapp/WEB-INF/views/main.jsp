<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍제감리교회</title>
<style>
    /* 헤더 전체를 감싸는 상자: 로고와 버튼 양 끝으로 찢기 */
    .header-container {
        display: flex;         
        justify-content: space-between; /* 양 끝 정렬 (좌측 로고 <---> 우측 버튼) */
        align-items: center;   
        padding: 15px 30px;         
        border-bottom: 1px solid #eeeeee; 
    }

    /* 왼쪽 로고+이름 묶음 상자 */
    .logo-area {
        display: flex;
        align-items: center;
    }

    .logo-img {
        width: 160px;           
        height: auto;          
        margin-right: 15px;    
    }

    .church-title {
        font-size: 22px;       
        font-weight: bold;     
        color: #333333;        
        margin: 0;             
    }

    /* 오른쪽 회원가입/로그인 버튼 영역 */
    .auth-area {
        display: flex;
        gap: 15px; /* 버튼 사이의 간격 */
    }

    /* 버튼 공통 스타일 */
    .auth-link {
        text-decoration: none; /* 글자 밑줄 제거 */
        font-size: 14px;
        color: #555555;
        padding: 6px 12px;
        border-radius: 4px;
        transition: all 0.2s;
    }

    /* 로그인 버튼 스타일 (테두리형) */
    .btn-login {
        border: 1px solid #cccccc;
    }
    .btn-login:hover {
        background-color: #f5f5f5;
    }

    /* 회원가입 버튼 스타일 (색상형) */
    .btn-join {
        background-color: #4A90E2; /* 교회 이미지와 잘 어울리는 깔끔한 파란색 */
        color: white;
    }
    .btn-join:hover {
        background-color: #357ABD;
    }
</style>
</head>
<body>

    <div class="header-container">
        <div class="logo-area">
            <img src="/images/logo.png" alt="교회로고" class="logo-img">
            <h1 class="church-title">홍제감리교회</h1>
        </div>
        
        <div class="auth-area">
            <a href="/login" class="auth-link btn-login">로그인</a>
            <a href="/join" class="auth-link btn-join">회원가입</a>
        </div>
    </div>

    <div style="padding: 30px;">
        <h2>반갑습니다. 홍제감리교회 홈페이지입니다.</h2>
    </div>
<div style="text-align: right; padding: 20px; background-color: #f8f9fa;">

    <%-- 1. 세션에서 "member" 가방을 꺼내봅니다. --%>
    <%@ page import="com.church.homepage.dto.MemberDTO" %>
    <%
        // 세션에 저장된 정보를 꺼내서 DTO 객체에 담음 (형변환 필요)
        MemberDTO loginMember = (MemberDTO) session.getAttribute("member");
    %>

    <%-- 2. 로그인 상태에 따라 화면 다르게 보여주기 --%>
    <% if(loginMember == null) { %>
        <a href="/login" style="margin-right: 10px; text-decoration: none; color: #333;">로그인</a>
        <a href="/join" style="text-decoration: none; color: #333;">성도 등록(회원가입)</a>
    <% } else { %>
        <span style="font-weight: bold; color: #4A90E2;">
            🎉 <%= loginMember.getUser_name() %> <%= loginMember.getPosition() %>님 환영합니다! (로그인 성공)
        </span>
        <a href="/logout" style="margin-left: 15px; text-decoration: none; color: red; font-size: 14px;">로그아웃</a>
    <% } %>

</div>
</body>
</html>