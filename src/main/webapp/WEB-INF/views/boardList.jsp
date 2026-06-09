<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="pagination">
    <a href="/board/list?curPage=${page.prevPage}">[이전]</a>
    
   <c:forEach var="board" items="${boardList}">
    <div class="card">
        <a href="/board/view?b_no=${board.b_no}">
            <img src="/img/${board.b_img}" style="width:100%">
            <h4>${board.b_title}</h4>
        </a>
    </div>
</c:forEach>
    
    <a href="/board/list?curPage=${page.nextPage}">[다음]</a>
</div>
</body>
</html>