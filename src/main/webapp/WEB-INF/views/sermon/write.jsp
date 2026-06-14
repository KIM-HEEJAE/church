<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>설교 등록</title>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
</head>
<body>
<jsp:include page="../header.jsp" />
   
        <h1>설교 등록</h1>
        <form action="/sermon/writeAction" method="post">
            <div>
                <label>제목</label><br>
                <input type="text" name="s_title" required style="width:100%">
            </div>
            <div>
                <label>설교자</label><br>
                <input type="text" name="s_preacher" required>
            </div>
            <div>
                <label>유튜브 영상 ID (주소창의 v= 뒤 11자리)</label><br>
                <input type="text" name="s_video_url" placeholder="예: dQw4w9WgXcQ" required style="width:100%">
            </div>
            <div>
                <label>본문</label><br>
                <input type="text" name="s_scripture" style="width:100%">
            </div>
            <br>
            <button type="submit">등록하기</button>
            <button type="button" onclick="history.back()">취소</button>
        </form>
    
</body>
</html>