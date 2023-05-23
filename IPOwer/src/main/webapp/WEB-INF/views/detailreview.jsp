<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnList").onclick = function() {
		location.href="/";
	}
	document.getElementById("btnUpdate").onclick = function(e) {
		
		if(confirm("정말수정할까요")) {
	
			frm.action="/board/edit?ARTICLE_PK="+e.target.name;
			frm.submit();
		}
	}
	
	document.getElementById("btnDelete").onclick = function() {
		if(confirm("정말 삭제할까요?")) {
			frm.action='deleteBoard';
			frm.submit();
		}
	}
}
</script>

</head>
<body>
** 상세보기 **
<br>
<form name="frm" method="get">
<table border="2">
	<tr>
		<td>번호</td>
		<td>${detail1.ARTICLE_PK}</td>
		<input type="hidden" value="${detail1.ARTICLE_PK}" name="ARTICLE_PK">	
		<td>작성자</td>
		<td>${detail1.USER_NAME}</td>	
	</tr>
	<tr>
		<td>작성일</td>
		<%-- <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" /> --%>
		<td>${detail1.ARTICLE_REGDATE}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${detail1.ARTICLE_TITLE}</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td>${detail1.ARTICLE_CONTENT}</td>
	</tr>

	<tr>
		<td>조회수</td>
		<td>${detail1.ARTICLE_VIEW}</td>
	</tr>
	<tr colspan="3">
		<td>
			<input type="button" value="목록" id="btnList">
			<input type="button" value="수정" id="btnUpdate" name="${detail1.ARTICLE_PK }">
			<input type="button" value="삭제" id="btnDelete">
		</td>
	</tr>
</table>
</form>
<hr />

<!-- <ul>
    <li>
        <div>
            <p>첫번째 댓글 작성자</p>
            <p>첫번째 댓글</p>
        </div>
    </li>
    <li>
        <div>
            <p>두번째 댓글 작성자</p>
            <p>두번째 댓글</p>
        </div>
    </li>
    <li>
        <div>
            <p>세번째 댓글 작성자</p>
            <p>세번째 댓글</p>
        </div>
    </li>
</ul> -->
<ul>
<c:forEach items="${reply}" var="reply">
<li>
    <div>
        <p>${reply.USER_NAME} / ${reply.COMMENT_REGDATE}</p>
        <p>${reply.COMMENT_CONTENT }</p>
    </div>
</li>    
</c:forEach>
</ul>
<div>
    <p>
        <label>댓글 작성자</label> <input type="text">
    </p>
    <p>
        <textarea rows="5" cols="50"></textarea>
    </p>
    <p>
        <button type="button">댓글 작성</button>
    </p>
</div>
</body>
</html>