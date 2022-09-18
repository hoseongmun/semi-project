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
	list_comment();
	$("#btnEdit").click(function() {
		document.form1.action="/jsp02/movie_servlet/check_pwd.do";
		document.form1.submit();
	});
	$("#btnList").click(function(){
		location.href="/jsp02/movie_servlet/list.do";
	});
	list_comment();
	$("#btnSave").click(function() {
		insert_comment();
	});	
	$("#btnReply").click(function() {
		document.form1.action="/jsp02/movie_servlet/input_Reply.do";
		document.form1.submit();
	});	
});

function insert_comment(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()+"&content="+$("#content").val();
	$.ajax({
		type:"post",
		url:"/jsp02/movie_servlet/comment_add.do",
		data:param,
		success:function(){
			$("#writer").val("");
			$("#content").val("");
			list_comment();
		}
	});
}

function list_comment(){
	$.ajax({
		type:"post",
		url:"${path}/movie_servlet/commentList.do",
		data:"num=${dto.num}",
		success: function(result){
			$("#div_comment").html(result);
		}		
	});
}
</script>
</head>
<body>
<h2>상세화면</h2>
<form name="form1" method="post">
 <table border="1" style="width:100%" class="table table-bordered">
  <tr>
   <td width="10%" align="center">날짜</td>
   <td width="40%">${dto.reg_date}</td>
   <td width="10%">조회수</td>
   <td width="40%">${dto.readcount }</td>
  </tr>
  <tr>
   <td align="center">이름</td>
   <td colspan="3">${dto.writer }</td>
  </tr>
  <tr>
   <td align="center">제목</td>
   <td colspan="3">${dto.subject }</td>
  </tr>  
  <tr>
   <td align="center">본문</td>
   <td colspan="3">${dto.content }</td>
  </tr>  
  <tr>
   <td align="center">비밀번호</td>
   <td colspan="3">
    <input class="form-control" type="password" name="passwd" id="passwd">
     <c:if test="${param.message=='error'}">
      <span style="color:red">비밀번호가 일치하지 않습니다.</span>
     </c:if>
   </td>
  </tr>
  <tr>
   <td align="center">첨부파일</td>
   <td colspan="3">
    <c:if test="${dto.filesize > 0 }">
     ${dto.filename } (${dto.filesize} bytes )
     <a class="p-2 link-secondary" href="{path}/movie_servlet/download.do?=num=${dto.num }">[다운로드]</a>
    </c:if>
   </td>
  </tr> 
  <tr>
   <td colspan="4" align="center">
    <input type="hidden" name="num" value="${dto.num }">
    <input class="input" type="button" value="수정/삭제" id="btnEdit">
    <input class="input" type="button" value="답변" id="btnReply">
    <input class="input" type="button" value="목록" id="btnList">
   </td>
  </tr> 
 </table>
</form>

<table border="1" style="width:100%" class="table">
 <tr>
  <td><input class="form-control" id="writer" placeholder="이름"> </td>
  <td rowspan="2"><button class="p-2 link-secondary" id="btnSave" type="button">확인</button> </td>
 </tr>
 <tr>
  <td><textarea class="form-control" rows="10" cols="100" placeholder="내용을 작성하세요" id="content"></textarea> </td>
 </tr>
</table>
<div id="div_comment"></div>
</body>
</html>