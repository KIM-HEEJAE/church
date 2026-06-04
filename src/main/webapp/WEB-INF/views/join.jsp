<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>회원가입 - 홍제감리교회</title>
<style>
    .join-container {
        width: 400px;
        margin: 50px auto;
        padding: 30px;
        border: 1px solid #dddddd;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .join-title {
        text-align: center;
        margin-bottom: 30px;
        color: #333333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        font-size: 14px;
    }
    .form-group input, .form-group select {
        width: 100%;
        padding: 10px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        box-sizing: border-box; /* 패딩 때문에 박스가 튀어나가는 것 방지 */
    }
    .btn-submit {
        width: 100%;
        padding: 12px;
        background-color: #4A90E2;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
    }
    .btn-submit:hover {
        background-color: #357ABD;
    }
    .optional-text {
        font-size: 12px;
        color: #888888;
        font-weight: normal;
    }
</style>
</head>
<body>

    <div class="join-container">
        <h2 class="join-title">⛪ 회원 등록 (회원가입)</h2>
        
        <form action="/joincomplete" method="post" onsubmit="return validateForm()">
            
            <div class="form-group">
                <label for="memberId">아이디</label>
                <input type="text" id="memberId" name="user_id" placeholder="사용할 아이디 입력" required>
                <span id="id_msg"></span>
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="user_pwd" placeholder="비밀번호 입력"  minlength="6" required>
            </div>
            
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="user_name" placeholder="성도 이름 입력" required>
            </div>
            
            <div class="form-group">
                <label for="email">이메일 <span class="optional-text">(선택사항)</span></label>
                <input type="email" id="email" name="email" placeholder="hongje@naver.com">
            </div>
            
            <div class="form-group">
                <label for="position">교회 직급</label>
                <select id="position" name="position" required>
                    <option value="">-- 직급을 선택해 주세요 --</option>
                    <option value="학생">학생</option>
                    <option value="청년">청년</option>
                    <option value="성도">성도</option>
                    <option value="집사">집사</option>
                    <option value="권사">권사</option>
                    <option value="장로">장로</option>
                    <option value="원로장로">원로장로</option>
                </select>
            </div>
            
            <button type="submit" class="btn-submit">교회 성도 가입하기</button>
        </form>
    </div>
<script>
// 1. 전역 변수 선언 (함수 바깥 맨 위에 있어야 합니다)
var isIdChecked = false;

// 2. 아이디 창에서 포커스 나갈 때 실행
$("#memberId").on("blur", function(){
	var user_id = $(this).val();
	
	if(user_id == ""){
		$("#id_msg").text("아이디를 입력해주세요.").css("color","red");
		isIdChecked = false;
		return;
	}
	
	$.ajax({
		url:'/idCheck',
		type: 'post',
		data: {user_id: user_id},
		success:function(data){
			if(data == "success"){
				$("#id_msg").text("사용 가능한 아이디입니다.").css("color","blue");
				isIdChecked = true; // 중복 없음 -> 가입 허용
			} else {
				$("#id_msg").text("이미 존재하는 아이디입니다.").css("color","red");
				isIdChecked = false; // 중복 있음 -> 가입 차단
			}
		}
	});
});

// 3. 가입 버튼 눌렀을 때 최종 실행되는 함수
function validateForm(){
	
	// 안전하게 제이쿼리가 아닌 순수 자바스크립트로 비밀번호 값 가져오기
	var pwd = document.getElementById("password").value;
	
	// 비밀번호 글자수 체크
	if(pwd.length < 6){
		alert("비밀번호는 6글자 이상이어야 합니다.");
		document.getElementById("password").focus();
		return false; // 전송 차단
	}
	
	// 아이디 중복체크 여부 최종 체크
	if(isIdChecked == false){
		alert("중복된 아이디는 사용할 수 없습니다. 다른 아이디를 입력해 주세요.");
		document.getElementById("memberId").focus();
		return false; // 전송 차단
	}
	
	// 모든 관문 통과 시 전송
	return true;
}
</script>
</body>
</html>