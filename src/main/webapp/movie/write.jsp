<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">

$(function(){
	$("#btnSave").click(function() {
		var writer=$("#writer").val();
		var subject=$("#subject").val();
		var content=$("#content").val();
		var passwd=$("#passwd").val();
		if(writer==""){
			alert("이름을 입력해주세요.");
			$("#writer").focus();
			return;
		}
		if(subject==""){
			alert("제목을 입력해주세요.");
			$("#subject").focus();
			return;
		}
		if(content==""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return;
		}
		if(passwd==""){
			alert("비밀번호를 입력해주세요.");
			$("#passwd").focus();
			return;
		}
		document.form1.submit(); //수동서밋! 반드시 해줘야함
	});
});

</script>
</head>
<body>
<h2>글쓰기</h2>
<form method="post" name="form1" enctype="multipart/form-data" action="${path}/movie_servlet/insert.do">
<table class="table">
 <tr>
  <td>이름</td>
  <td><input class="form-control" name="writer" id="writer"></td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input class="form-control" name="subject" id="subject" size="60"></td>
 </tr> 
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="content" id="content"></textarea></td>
 </tr>
 <tr>
  <td>첨부파일</td>
  <td><input class="form-control" type="file" name="file1"></td>
 </tr> 
 <tr>
  <td>비밀번호</td>
  <td><input class="form-control" type="password" name="passwd" id="passwd"></td>
 </tr> 
 <tr>
  <td colspan="2" align="center">
   <input class="form-control" type="button" value="확인" id="btnSave">
  </td>
 </tr>
</table>

</form>
</body>
</html>