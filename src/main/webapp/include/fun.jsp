<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

 <a class="btn btn-primary btn-sm" href="/jsp02/sub_servlet/list.do">상품목록</a> | 

  
 <c:if test="${sessionScope.userid != null }">
	<a class="btn btn-primary btn-sm" href="/jsp02/cart_servlet/list.do">장바구니</a> | 
</c:if> 

<div style="text-align:right;">
<c:choose>
	<c:when test="${sessionScope.userid == null }"> 
		<a class="btn btn-primary btn-sm" href="/jsp02/movie/member.jsp">로그인</a> | 
		<a class="btn btn-primary btn-sm" href="/jsp02/movie/admin_login.jsp">관리자 로그인</a> | 
	</c:when>
	<c:otherwise> |
		<button class="btn btn-outline-secondary btn-sm">${sessionScope.name}님이 로그인중입니다.</button>
		<a class="btn btn-primary btn-sm" href="/jsp02/members_servlet/logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
</div>
<hr>