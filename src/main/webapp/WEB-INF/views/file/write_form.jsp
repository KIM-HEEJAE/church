<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주보 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="../header.jsp" />

    <div class="board-container">
        <div class="write-form">
            <h2>새 주보 등록</h2>
            <hr>
            <form action="/file/write" method="post" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" placeholder="주보 제목을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content" placeholder="주보에 대한 설명을 입력하세요"></textarea>
                </div>

                <div class="form-group">
                    <label for="files">파일 첨부</label>
                    <input type="file" id="files" name="files" multiple>
                </div>

                <div style="text-align: right;">
                    <button type="button" class="btn-write" onclick="history.back()">취소</button>
                    <button type="submit" class="btn-submit">등록하기</button>
                </div>
            </form>
        </div>
    </div>

</body>
   <jsp:include page="/WEB-INF/views/footer.jsp" />

</html>