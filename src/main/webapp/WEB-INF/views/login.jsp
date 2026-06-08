<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 홍제감리교회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .login-container { width: 350px; margin: 100px auto; padding: 30px; border: 1px solid #dddddd; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    .login-title { text-align: center; margin-bottom: 30px; color: #333333; }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; }
    .form-group input { width: 100%; padding: 10px; border: 1px solid #cccccc; border-radius: 4px; box-sizing: border-box; }
    .btn-login { width: 100%; padding: 12px; background-color: #4A90E2; color: white; border: none; border-radius: 4px; font-size: 16px; font-weight: bold; cursor: pointer; margin-top: 10px; }
    .error-msg { color: red; font-size: 13px; margin-bottom: 15px; text-align: center; }
    /* 모달 스타일 */
    .modal { display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:9999; }
    .modal-content { background:#fff; width:350px; margin:100px auto; padding:20px; border-radius:8px; position:relative; }
    .close, .closePw { cursor:pointer; float:right; font-size:20px; }
</style>
</head>
<body>

    <div class="login-container">
        <h2 class="login-title">⛪ 회원 로그인</h2>
        
        <form action="${pageContext.request.contextPath}/loginAction" method="post">            
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
        
        <button type="button" id="btnOpenFindId" style="width:100%; margin-top:10px; background:none; border:1px solid #ccc; cursor:pointer; padding:10px;">아이디 찾기</button>
        <button type="button" id="btnOpenFindPw" style="width:100%; margin-top:5px; background:none; border:1px solid #ccc; cursor:pointer; padding:10px;">비밀번호 찾기</button>
    </div>

    <div id="findIdModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3>아이디 찾기</h3>
            <form id="findIdForm">
                <input type="text" name="user_name" placeholder="이름" required style="width:100%; padding:8px; margin-bottom:10px; box-sizing:border-box;"><br>
                <input type="text" name="birthYear" placeholder="년(4자)" required style="width:30%; padding:8px; box-sizing:border-box;">
                <input type="text" name="birthMonth" placeholder="월" required style="width:30%; padding:8px; box-sizing:border-box;">
                <input type="text" name="birthDay" placeholder="일" required style="width:30%; padding:8px; box-sizing:border-box;"><br>
                <button type="button" id="btnFindId" style="width:100%; padding:10px; margin-top:10px; cursor:pointer;">찾기</button>
            </form>
            <div id="resultArea" style="margin-top:15px; font-weight:bold; text-align:center;"></div>
        </div>
    </div>

    <div id="findPwModal" class="modal">
        <div class="modal-content">
            <span class="closePw">&times;</span>
            <h3>비밀번호 찾기</h3>
            <form id="findPwForm">
                <input type="text" name="user_id" placeholder="아이디" required style="width:100%; padding:8px; margin-bottom:10px; box-sizing:border-box;">
                <input type="email" name="email" placeholder="가입한 이메일" required style="width:100%; padding:8px; margin-bottom:10px; box-sizing:border-box;">
                <button type="button" id="btnFindPw" style="width:100%; padding:10px; cursor:pointer;">임시 비밀번호 발송</button>
            </form>
            <div id="pwResultArea" style="margin-top:15px; font-weight:bold; text-align:center;"></div>
        </div>
    </div>

    <script>
        // 모달 열기/닫기 이벤트
        $("#btnOpenFindId").click(function(){ $("#findIdModal").show(); });
        $(".close").click(function(){ $("#findIdModal").hide(); });

        $("#btnOpenFindPw").click(function(){ $("#findPwModal").show(); });
        $(".closePw").click(function(){ $("#findPwModal").hide(); });

        // 아이디 찾기 AJAX
        $("#btnFindId").click(function(){
            $.ajax({
                url: "/member/findIdAction",
                type: "post",
                data: $("#findIdForm").serialize(),
                success: function(res){
                    $("#resultArea").html(res !== "none" ? "아이디: <span style='color:blue;'>" + res + "</span>" : "일치하는 정보가 없습니다.");
                }
            });
        });

        // 비밀번호 찾기 AJAX
        $("#btnFindPw").click(function(){
            $.ajax({
                url: "/member/findPwAction",
                type: "post",
                data: $("#findPwForm").serialize(),
                success: function(res){
                    $("#pwResultArea").html(res === "success" ? "임시 비밀번호를 발송했습니다." : "정보를 확인해주세요.");
                }
            });
        });
    </script>
</body>
</html>