<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="video-wrapper">
    <iframe src="https://www.youtube.com/embed/${sermon.s_video_url}" 
            frameborder="0" 
            allowfullscreen>
    </iframe>
</div>
<h2>${sermon.s_title}</h2>
<p>${sermon.s_preacher} 목사님 | ${sermon.s_date}</p>
</body>
</html>