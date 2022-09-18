<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/admin_fun.jsp" %>
<script>
function delete_sub(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="/jsp02/admin_servlet/delete.do";
		document.form1.submit();
	}
}
function update_sub(){
	var sub_name=document.form1.sub_name.value; //태그에 입력한 값
	var price=document.form1.price.value;
	var description=document.form1.description.value;
	if(sub_name==""){
		alert("상품명을 입력하세요");
		document.form1.price.focus();
		return;
	}
	if(price==""){
		alert("가격을 입력하세요");
		document.form1.price.focus();
		return;
	}
	if(description==""){
		alert("상품설명을 입력하세요");
		document.form1.description.focus();
		return;
	}	
	document.form1.action="/jsp02/admin_servlet/update.do";
	document.form1.submit();
}
</script>
</head>
<body>
<h2>상품수정</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table class="table">
	<tr>
		<td>상품명</td>
		<td><input class="input" name="sub_name" value="${dto.sub_name}"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input class="input" name="price" value="${dto.price}"></td>
	</tr>	
	<tr>
		<td>상품설명</td>
		<td><textarea rows="5" cols="60" name="description">${dto.description}</textarea></td>
	</tr>
	<tr>
		<td>상품이미지</td>
		<td>
			<img src="/jsp02/movie/images/sub/${dto.filename}" width="300px" height="300px">
			<input class="input" type="file" name="file1">
		</td>
	</tr>	 
	<tr>
		<td colspan="2" align="center">
			<!-- 수정,삭제에 필요한 상품코드 -->
			<input class="input" type="hidden" name="sub_code" value="${dto.sub_code}">
			<input class="input" type="button" value="수정" onclick="update_sub()">
			<input class="input" type="button" value="삭제" onclick="delete_sub()">
			<input class="input" type="button" value="목록" onclick="location.href='/jsp02/sub_servlet/list.do'">
		</td>
	</tr>
</table>
</form>
</body>
</html>