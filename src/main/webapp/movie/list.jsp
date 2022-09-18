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
	$("#btnWrite").click(function() {
		location.href="${path}/movie/write.jsp";
	});
});

//클릭한 페이지로 이동 기능
function list(page){
	location.href="${path}/movie_servlet/list.do?curPage="+page+"&search_option=${search_option}&keyword=${keyword}";
}

</script>

</head>
<body>
<h2>영화 요청게시판</h2>

<form name="form1" method="post" action="${path}/movie_servlet/search.do">
 <select name="search_option">
 <c:choose>
  <c:when test="${search_option == null || search_option == 'all' }">
	<option value="all" selected>통합검색</option>
	<option value="writer">이름</option>
	<option value="subject">제목</option>
	<option value="content">내용</option>
  </c:when>
  <c:when test="${search_option == 'writer' }">
	<option value="all">통합검색</option>
	<option value="writer" selected>이름</option>
	<option value="subject">제목</option>
	<option value="content">내용</option>
  </c:when>
  <c:when test="${search_option == 'subject' }">
	<option value="all">통합검색</option>
	<option value="writer">이름</option>
	<option value="subject" selected>제목</option>
	<option value="content">내용</option>
  </c:when>
  <c:when test="${search_option == 'content' }">
	<option value="all">통합검색</option>
	<option value="writer">이름</option>
	<option value="subject">제목</option>
	<option value="content" selected>내용</option>
  </c:when>
 </c:choose>
 </select>
 <input name="keyword">
 <button id="btnSearch" class="btn btn-secondary btn-sm">검색</button>
</form>
 <button id="btnWrite" class="btn btn-primary btn-sm">글쓰기</button>

<table border="1" style="width:100%;" class="table table-striped table-hover">
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>제목</th>
    <th>날짜</th>
    <th>조회수</th>
    <th>첨부파일</th>
    <th>파일사이즈</th>
    <th>다운로드</th>
  </tr>
<c:forEach var="dto" items="${list}">  
<c:choose>
  <c:when test="${dto.show == 'y'}">
	  <tr align="center">
	    <td>${dto.num}</td>
	    <td>${dto.writer}</td>
	    <td align="left">
	    	<c:forEach var="i" begin="1" end="${dto.re_level}">
	    	 &nbsp;&nbsp;
	    	</c:forEach>
	    <c:if test="${dto.re_level > 0}">Re:</c:if>
	    <a href="${path}/movie_servlet/view.do?num=${dto.num}">${dto.subject}</a>
	    <c:if test="${dto.comment_count > 0}">
	    	<span style="color:green;">(${dto.comment_count})</span>
	     </c:if>	
	    </td>
	    <td>${dto.reg_date}</td>
	    <td>${dto.readcount}</td>
		<td align="center">
		 <c:if test="${dto.filesize > 0 }">
		  <a href="${path}/movie_servlet/download.do?num=${dto.num}">
		   <img src="${path}/movie/images/file_img.png" width="20px" height="20px">
		  </a>
		 </c:if>
		</td>
	    <td>${dto.filesize}</td>
	    <td>${dto.down}</td>
	  </tr>
 </c:when>
  <c:otherwise>
   <tr>
    <td>${dto.num}</td>
    <td colspan="7" align="center">삭제된 게시물입니다.</td>
   </tr>
  </c:otherwise>
 </c:choose>
</c:forEach>  
 <!-- 페이지 네비게이션 출력  -->
 <tr>
  <td colspan="7" align="center">
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