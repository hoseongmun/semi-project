<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
 <table border="1" style="width:100%" class="table">
  <c:forEach var="row" items="${list }">
   <tr>
    <td>
     ${row.writer}
     (<fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/> )<br>
     ${row.content}
    </td>
   </tr>
  </c:forEach>
 </table>
</body>
</html>