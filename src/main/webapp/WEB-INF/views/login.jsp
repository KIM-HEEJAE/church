<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 홍제감리교회</title>
<style>
    .login-container { width: 350px; margin: 100px auto; padding: 30px; border: 1px solid #dddddd; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    .login-title { text-align: center; margin-bottom: 30px; color: #333333; }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; }
    .form-group input { width: 100%; padding: 10px; border: 1px solid #cccccc; border-radius: 4px; box-sizing: border-box; }
    .btn-login { width: 100%; padding: 12px; background-color: #4A90E2; color: white; border: none; border-radius: 4px; font-size: 16px; font-weight: bold; cursor: pointer; margin-top: 10px; }
    .btn-login:hover { background-color: #357ABD; }
    .error-msg { color: red; font-size: 13px; margin-bottom: 15px; text-align: center; }
</style>
</head>
<body>

    <div class="login-container">
        <h2 class="login-title">⛪ 회원 로그인</h2>
        
        <form action="/loginAction" method="post">
            
            <% if(request.getAttribute("error") != null) { %>
                <div class="error-msg"><%= request.getAttribute("error") %></div>
            <% } %>
            
            <div class="form-group">
                <label for="user_id">아이디</label>
                <input type="text" id="user_id" name="user_id" placeholder="아이디 입력" required>
            </div>
            
            <div class="form-group">
                <label for="user_pwd">비밀번호</label>
                <input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호 입력" required>
            </div>
            
            <button type="submit" class="btn-login">로그인하기</button>
        </form>
    </div>

</body>
</html>