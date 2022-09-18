<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fun.jsp" %> 
</head>
<body>
<h2>상품 정보</h2>
<table class="table table-striped table-hover">
	<tr>
		<td><img src="/jsp02/movie/images/sub/${dto.filename}" width="300px" height="300px"></td>
		<td align="center">
			<table class="table">
				<tr>
					<td>상품명</td>
					<td>${dto.sub_name}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${dto.price}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>${dto.description}</td>
				</tr>
				<tr>
					<td colspan="2">
						<form name="form1" method="post" action="/jsp02/cart_servlet/insert.do">
						<input type="hidden" name="sub_code" value="${dto.sub_code}">
						<select name="amount">
							<c:forEach begin="1" end="10" var="i">
							<option value="${i}">${i}</option>
							</c:forEach>
						</select>&nbsp;개 &nbsp;&nbsp;
						<input class="btn btn-secondary btn-sm" type="submit" value="장바구니 담기">
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>