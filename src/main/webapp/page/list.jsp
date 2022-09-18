<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
<style type="text/css">

table{
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}
th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
<table>
 <tr>
  <th>사번</th>
  <th>이름</th>
 </tr>
 <c:forEach var="row" items="${list}">
 <tr>
  <td>${row.empno}</td>
  <td>${row.ename}</td>
 </tr>
 </c:forEach>
 <!-- 페이지 네비게이션 출력  -->
 <tr>
  <td colspan="2" align="center">
   <c:if test="${page.curPage > 1}">
    <a href="#" onclick="list('1')">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1 }">
    <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
     <span style="color:red;">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="list('${num}')">${num }</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage }">
    <a href="#" onclick="list('${page.totPage}')">[끝]</a>
   </c:if>   
   
  </td>
 </tr>
</table>
</body>
</html>