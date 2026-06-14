<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설교 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <div class="video-wrapper">
        <iframe src="https://www.youtube.com/embed/${sermon.s_video_url}" 
                frameborder="0" allowfullscreen>
        </iframe>
    </div>
    
    <h2>${sermon.s_title}</h2>
    <hr>
    <p><strong>설교자:</strong> ${sermon.s_preacher}</p>
    <p><strong>날짜:</strong> ${sermon.s_date}</p>
    <p><strong>본문:</strong> ${sermon.s_scripture}</p>
    
    <br>
    <button onclick="location.href='/sermon/list'">목록으로</button>
</div>
</body>
</html>