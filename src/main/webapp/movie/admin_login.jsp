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
<c:if test="${param.message == 'error' }">
	<script>alert("아이디 또는 비밀번호가 일치하지 않습니다.")</script>
</c:if>
<c:if test="${param.message == 'logout' }">
	<script>alert("로그아웃되었습니다.")</script>
</c:if>
</head>
<body>
<h2>관리자 로그인</h2>
<form method="post" name="form1" action="${path}/admin_servlet/login.do">
<table border="1" class="table table-bordered">
	<tr>
		<td>아이디</td>
		<td><input name="userid" placeholder="아이디"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" placeholder="비밀번호"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인">
		</td>
	</tr>
</table>
</form>
</body>
</html>