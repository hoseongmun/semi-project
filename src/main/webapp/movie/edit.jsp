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
	$("#btnDelete").click(function() {
	 if(confirm("정말 삭제하시겠습니까?")){
		 document.form1.action = "${path}/movie_servlet/delete.do";
		 document.form1.submit();
	 }	
	});
	
	$("#btnUpdate").click(function() {
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
		var filename = document.form1.file1.value;
		var start = filename.lastIndexOf(".")+1;
		if(start != -1){
			var ext = filename.substring(start, filename.length);
			if(ext == "jsp" || ext == "exe"){
				alert("업로드할 수 없는 파일 형식입니다.");
				return;
			}
		}
		document.form1.action="${path}/movie_servlet/update.do";
		document.form1.submit();
	});
});

</script>
</head>
<body>
<h2>게시물 수정</h2>
<form method="post" name="form1" enctype="multipart/form-data" action="${path}/movie_servlet/insert.do">
<table class="table table-bordered">
 <tr>
  <td>이름</td>
  <td><input name="writer" id="writer" value="${dto.writer}"></td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="subject" id="subject" size="60" value="${dto.subject}"></td>
 </tr> 
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="content" id="content" value="${dto.content}"></textarea></td>
 </tr>
 <tr>
  <td>첨부파일</td>
  <td>
   <c:if test="${dto.filesize > 0 }">
    ${dto.filename } ( ${dto.filesize } bytes )
    <input type="checkbox" name="delete_file"> 첨부파일 삭제
    <br>
   </c:if>
   <input type="file" name="file1">
  </td>
 </tr> 
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" id="passwd"></td>
  <c:if test="${param.pwd_error == 'y' }">
   <span style="color:red">비밀번호가 틀렸습니다.</span>
  </c:if>
 </tr> 
 <tr>
  <td colspan="2" align="center">
   <input type="hidden" name="num" value="${dto.num }">
   <input type="button" value="수정" id="btnUpdate">
   <c:if test="${dto.comment_count == '0'}">
    <input type="button" value="삭제" id="btnDelete">
   </c:if>
  </td>
 </tr>
</table>

</form>
</body>
</html>