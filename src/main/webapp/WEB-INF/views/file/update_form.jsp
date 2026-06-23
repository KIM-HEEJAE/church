<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주보 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="../header.jsp" />

    <div class="board-container">
        <div class="write-form">
            <h2>주보 수정</h2>
            <hr>
            
            <form action="/file/update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${board.id}">

                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" value="${board.title}" required>
                </div>

                <div class="form-group">
                    <label>기존 첨부 파일</label>
                    <div class="file-list-box">
                        <c:choose>
                            <c:when test="${empty board.fileNames}">
                                <span>등록된 파일이 없습니다.</span>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="img" items="${board.fileNames}">
                                    <span class="file-item">📁 ${img}</span>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="form-group">
                    <label for="files">새 파일 선택 (선택 시 기존 파일 교체)</label>
                    <input type="file" id="files" name="files" multiple>
                </div>

                <div style="text-align: right;">
                    <button type="button" class="btn-write" onclick="history.back()">취소</button>
                    <button type="submit" class="btn-submit">수정 완료</button>
                </div>
            </form>
        </div>
    </div>

</body>
   <jsp:include page="/WEB-INF/views/footer.jsp" />

</html>