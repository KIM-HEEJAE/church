<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.church.homepage.dto.MemberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/style.css">
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
        <a href="javascript:void(0);" onclick="checkLoginAndOpenChat()">채팅</a>
        <a href="#none">카페</a>
        <a href="#none">일정</a>
    </div>
</div>
<script>
    let socket = null;
    document.addEventListener("DOMContentLoaded", function() {
        const inputArea = document.getElementById('chat-input');
        
        if (inputArea) {
            // keypress 대신 keydown 사용 (더 정확함)
            inputArea.addEventListener('keydown', function (e) {
                if (e.key === 'Enter') {
                    e.preventDefault(); // 기본 폼 제출 동작 방지 (중복 입력 원인)
                    sendMessage();
                }
            });
        }
    });

        // ... 나머지 함수들 (connectWebSocket, sendMessage, loadChatHistory 등) ...
   
    // 1. 웹소켓 연결 함수
   function connectWebSocket() {
    if (socket === null) {
        socket = new WebSocket("ws://" + location.host + "/chat");

        socket.onopen = function() {
            console.log("웹소켓 연결 성공!");
        };

        // 서버에서 메시지가 왔을 때 화면에 추가하는 핵심 로직
        socket.onmessage = function(event) {
            console.log("서버로부터 받은 메시지:", event.data); // 디버깅용
            
            let msgBox = document.getElementById('chat-messages');
            let div = document.createElement('div');
            
            // event.data가 "[직책] 이름: 메시지" 형태일 것임
            div.textContent = event.data; 
            msgBox.appendChild(div);
            
            // 화면 스크롤 하단 고정
            msgBox.scrollTop = msgBox.scrollHeight;
        };

        socket.onerror = function(err) {
            console.error("웹소켓 에러:", err);
        };
    }
}

    // 2. 채팅창 열기
    function checkLoginAndOpenChat() {
        // 로그인 여부를 자바스크립트 변수로 넘겨받는 것이 더 안전합니다
        const isLogin = <%= (loginMember != null) %>; 
        
        if (!isLogin) {
            alert("로그인 후 이용 가능합니다.");
            location.href = "/login";
            return;
        }

        var chatWindow = document.getElementById('chat-window');
        chatWindow.style.display = 'flex';
        
        loadChatHistory();
        connectWebSocket();
    }

    // 3. 메시지 전송
    function sendMessage() {
    let input = document.getElementById('chat-input');
    let message = input.value.trim();
    
    if(message === "") return;
    
    if (socket && socket.readyState === WebSocket.OPEN) {
        socket.send(message); 
        input.value = ""; // 입력창 비우기
    } else {
        alert("서버 연결이 끊겼습니다. 새로고침 후 다시 시도하세요.");
    }
}

    // 4. 기록 불러오기
    function loadChatHistory() {
    fetch('/chat/history')
        .then(res => res.json())
        .then(data => {
            let msgBox = document.getElementById('chat-messages');
            msgBox.innerHTML = ""; // 기존 내용 초기화
            
            data.forEach(item => {
                // 직책이 있으면 [직책] 추가, 없으면 빈 문자열
                let pos = item.position ? "[" + item.position + "] " : "";
                
                // 전체 메시지 조합: [직책]이름: 메시지
                let displayMsg = pos + item.user_name + ": " + item.message;
                
                let div = document.createElement('div');
                div.textContent = displayMsg; // 텍스트로 안전하게 출력
                msgBox.appendChild(div);
            });
            
            msgBox.scrollTop = msgBox.scrollHeight; // 맨 아래로 스크롤
        })
        .catch(err => console.error("기록 불러오기 실패:", err));
}

    // 5. 닫기
    function closeChat() {
        document.getElementById('chat-window').style.display = 'none';
    }
   
</script>
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
                        <li><a href="/intro/	time">예배시간</a></li>
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
                        <li><a href="/sermon/list">주일설교</a></li>
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
                    <a href="/choir">찬양대</a>
                    <ul class="submenu">
                        <li><a href="/choir">찬양대 안내</a></li>
<!--                         <li><a href="/intro/grade">글로리아 성가대</a></li>
                        <li><a href="/intro/grade">할렐루야 성가대</a></li>
                        <li><a href="/intro/grade">늘찬양 성가대</a></li>    -->
                    </ul>
                </li>
                <!-- 6. 교회앨범 대메뉴 클릭 시 -> /intro/album(교회 앨범)로 변경 -->
                <li class="dropdown-item">
                    <a href="/board/list">교회앨범</a>
                    <ul class="submenu">
                        <li><a href="/board/list">교회 앨범</a></li>
                    </ul>
                </li>
                <!-- 7. 교회소식 대메뉴 클릭 시 -> /intro/news(교회 소식)로 변경 -->
                <li class="dropdown-item">
                    <a href="/file/list">교회소식</a>
                    <ul class="submenu">
                        <li><a href="/file/list">교회 소식</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
    </div>
   

</header>
<div id="chat-window">
    <div class="chat-header">
        <span>교인 대화방</span>
        <button onclick="closeChat()">X</button>
    </div>
    <div id="chat-messages"></div>
    <div class="chat-input-area">
        <input type="text" id="chat-input" placeholder="메시지 입력...">
        <button onclick="sendMessage()">전송</button>
    </div>
</div>
</body>
</html>