<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>앨범 게시글 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="board-container">
        <div class="write-form">
            <h2>앨범 게시글 등록</h2>
            <hr>
            
            <form action="/board/writeAction" method="post" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label for="b_title">제목</label>
                    <input type="text" id="b_title" name="b_title" placeholder="앨범 제목을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="b_content" placeholder="앨범 설명을 입력하세요"></textarea>
                </div>

                <div class="form-group">
                    <label for="files">대표 사진 (다중 선택 가능)</label>
                    <input type="file" id="files" name="files" multiple="multiple">
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