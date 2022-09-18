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
	$("#btn_add").click(function(){
		location.href="${path}/movie/sub_write.jsp";
	});
});
</script>
</head>
<body>
<%@ include file="../include/admin_fun.jsp" %>
<h2>상품목록</h2>
<br>
<c:if test="${sessionScope.userid != null }">
	<button class="button" type="button" id="btn_add">상품등록</button>
</c:if>
<table border="1" width="500px" class="table">
	<tr align="center">	
		<th>상품코드</th>
		<th>&nbsp;</th>
		<th>상품명</th>
		<th>가격</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.sub_code}</td>
		<td><img src="/jsp02/movie/images/sub/${row.filename}" 
			width="100px" height="100px"></td>
		<td><a class="input" href="/jsp02/sub_servlet/detail.do?sub_code=${row.sub_code}">
			${row.sub_name}</a>
			<c:if test="${sessionScope.userid != null }">
				<br><br>
				<a class="btn btn-sm btn-outline-secondary" href="/jsp02/admin_servlet/edit.do?sub_code=${row.sub_code}">
				[편집]</a>
			</c:if>
		</td>
		<td><fmt:formatNumber value="${row.price}" pattern="#,###"/></td>			
	</tr>
</c:forEach>	
</table>	
</body>
</html>