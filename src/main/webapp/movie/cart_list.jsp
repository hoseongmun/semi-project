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
<script>
$(function(){
	$("#btnList").click(function(){
		location.href="${path}/sub_servlet/list.do";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${path}/cart_servlet/delete_all.do";
		}
	});
});
</script>
<script type="text/javascript"></script>
</head>
<body>
<form action="${path}/cart_servlet/update.do" method="post">
<h2>장바구니</h2>

<table border="1" width="400px" class="table">
	<tr>
		<th>상품명</th>
		<th>단가</th>
		<th>수량</th>
		<th>금액</th>
		<th>&nbsp;</th>
	</tr>
 <c:forEach var="dto" items="${items}">
	<tr>
		<td>${dto.sub_name}</td>
		<td>${dto.price}</td>
		<td>
			<input type="number" style="width:50px;" min="0" max="100"
			name="amount" value="${dto.amount}">
			<input type="hidden" name="sub_code" value="${dto.sub_code}">
			<input type="hidden" name="cart_id" value="${dto.cart_id}">
		</td>
		<td>${dto.money}</td>
		<td><a class="btn btn-sm btn-outline-secondary" href="${path}/cart_servlet/delete.do?cart_id=${dto.cart_id}">삭제</a></td>
	</tr>
</c:forEach> 
	<tr>
		<td colspan="5" align="center">
			<c:if test="${sum_money > 0 }">
				장바구니 금액 합계:
				<fmt:formatNumber value="${sum_money}" pattern="#,###" />
			</c:if>
			<c:if test="${sum_money == 0 }">
				장바구니가 비었습니다.
			</c:if>
		</td>
	</tr>	
</table>
<button class="btn btn-sm btn-outline-secondary" id="btnUpdate">수정</button>
</form>
<button class="btn btn-sm btn-outline-secondary" type="button" id="btnDelete">장바구니 비우기</button>
<button class="btn btn-sm btn-outline-secondary" type="button" id="btnList">상품목록</button>
</body>
</html>