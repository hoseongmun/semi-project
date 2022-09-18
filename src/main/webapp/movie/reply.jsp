<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnSave").click(function(){ //버튼 클릭
		var writer=$("#writer").val(); //태그에 입력한 값
		var subject=$("#subject").val();
		var content=$("#content").val();
		var passwd=$("#passwd").val();
		if(writer==""){
			alert("이름을 입력하세요.");
			$("#writer").focus();
			return;
		}
		if(subject==""){
			alert("제목을 입력하세요.");
			$("#subject").focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return;
		}
		if(passwd==""){
			alert("비번을 입력하세요.");
			$("#passwd").focus();
			return;
		}				
		document.form1.submit();
	});
});
</script>
</head>
<body>
<h2>답변쓰기</h2>
<form name="form1" method="post" 
action="/jsp02/movie_servlet/insertReply.do">
<table border="1" style="width: 100%" class="table">
	<tr>
		<td align="center">이름</td>
		<td><input class="form-control" name="writer" id="writer"></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input class="form-control" name="subject" id="subject" size="60" value="${dto.subject}"></td>
	</tr>
	<tr>
		<td align="center">본문</td>
		<td><textarea rows="5" cols="60" name="content" id="content">${dto.content}</textarea></td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td><input class="form-control" type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="num" value="${dto.num}">
			<input class="btn btn-sm btn-outline-secondary" type="button" value="확인" id="btnSave">
		</td>
	</tr>
</table>
</form>
</body>
</html> 