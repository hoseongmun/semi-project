<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="btn-group">
<a class="btn btn-primary btn-sm" href="${path}/sub_servlet/list.do" >구독종류</a>
<a class="btn btn-primary btn-sm" href="${path}/movie/sub_write.jsp">구독상품등록</a>
 
<c:choose>
	<c:when test="${sessionScope.userid == null }">
		<a class="btn btn-primary btn-sm" href="${path}/movie/admin_login.jsp">관리자 로그인</a> 
	</c:when>
	<c:otherwise>
		<button class="btn btn-outline-secondary btn-sm">${sessionScope.name}님이 로그인중입니다.</button>
		<a class="btn btn-primary btn-sm" href="${path}/admin_servlet/logout.do">로그아웃</a>
	</c:otherwise>

</c:choose>  
</div>
<hr>