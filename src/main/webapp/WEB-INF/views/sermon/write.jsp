<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>설교 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="../header.jsp" />

    <div class="board-container">
        <div class="write-form">
            <h2>설교 등록</h2>
            <hr>

            <form action="/sermon/writeAction" method="post">
                <div class="form-group">
                    <label for="s_title">제목</label>
                    <input type="text" id="s_title" name="s_title" placeholder="설교 제목을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="s_preacher">설교자</label>
                    <input type="text" id="s_preacher" name="s_preacher" placeholder="설교자 성함을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="s_video_url">유튜브 영상 ID</label>
                    <input type="text" id="s_video_url" name="s_video_url" placeholder="예: dQw4w9WgXcQ (v= 뒤 11자리)" required>
                    <small style="color: #666; font-size: 0.85em;">* 유튜브 주소창의 v= 뒤에 있는 11자리를 정확히 입력해주세요.</small>
                </div>

                <div class="form-group">
                    <label for="s_scripture">본문</label>
                    <input type="text" id="s_scripture" name="s_scripture" placeholder="예: 마태복음 5장 1~12절">
                </div>

                <div style="text-align: right; margin-top: 20px;">
                    <button type="button" class="btn-write" onclick="history.back()">취소</button>
                    <button type="submit" class="btn-submit">등록하기</button>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>