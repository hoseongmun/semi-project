<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
@import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.login-block{
    background: #DE6262;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #FFB88C, #DE6262); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
float:left;
width:100%;
padding : 50px 0;
}
.banner-sec{background:url(images/back1.jpg) no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}

 .container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);}
.carousel-inner{border-radius:0 10px 10px 0;}
.carousel-caption{text-align:left; left:5%;}
.login-sec{padding: 50px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#FEB58A; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #DE6262; color:#fff; font-weight:600;}
.banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
.banner-text h2{color:#fff; font-weight:600;}
.banner-text h2:after{content:" "; width:100px; height:5px; background:#FFF; display:block; margin-top:20px; border-radius:3px;}
.banner-text p{color:#fff;}
</style>
<script type="text/javascript">
$(function(){
	$("#btnInsert").click(function() {
		location.href="${path}/movie/insert_member.jsp";
	});
});
</script>
<c:if test="${param.message == 'error' }">
 <script>
   alert("아이디 또는 비밀번호가 다릅니다.");
 </script>
</c:if>
<c:if test="${param.message == 'logout' }">
 <script>
   alert("로그아웃하셨습니다.")
 </script>
 
</c:if>
<%-- <c:if test="${not empty cookie.idCheck }">
 <c:set value="checked" var="checked" />
</c:if> --%>


</head>
<body>
<%@ include file="../include/fun.jsp" %>
 <section class="login-block">
  <div class="container">
   <div class="row">
   
	<div class="col-md-4 login-sec">
     <h2 class="text-center">로그인</h2>
     <form class="login-form" method="post" name="form1" action="/jsp02/members_servlet/login.do">
     
     <div class="form-group">
      <label for="exampleInputEmail1" class="text-uppercase">아이디</label>
      <input type="text" class="form-control" placeholder="아이디" name="userid">
     </div>
     
     <div class="form-group">
      <label for="exampleInputPassword1" class="text-uppercase">비밀번호</label>
      <input type="password" class="form-control" placeholder="비밀번호" name="passwd">
     </div>
     
     <div class="form-check">
      <label class="form-check-label">
       <input type="checkbox" class="form-check-input" id="idCheck" name="idCheck">
       <small>아이디 기억하기</small>
      </label>
      <button type="submit" class="btn btn-primary btn-sm float-right" id="btnLogin">확인</button>
     </div>
     </form>
     
      <button class="btn btn-sm btn-outline-secondary float-left" id="btnInsert">아이디가 없으신가요?</button>  
     <div class="copy-text" align="center">MovieSHOP <i class="fa fa-heart"></i></div>
	
	</div>
		
		<div class="col-md-8 banner-sec">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
   <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img class="d-block img-fluid" src="images/back3.jpg">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>MovieSHOP</h2>
            <p>MovieSHOP에 오신 여러분 환영합니다. 저희 MovieSHOP은 최선의 서비스를 최저의 가격으로 제공하기 위해 최선을 다하고 있습니다. 많은 관심과 성원 부탁드립니다.</p>
        </div>	
      </div>
    </div>
    
    <div class="carousel-item">
      <img class="d-block img-fluid" src="images/back4.jpg">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>MovieSHOP</h2>
            <p>저희 무비샵은 각종 장르의 영화를 여러분께 제공합니다.</p>
        </div>	
      </div>
    </div>
    
    <div class="carousel-item">
      <img class="d-block img-fluid" src="images/back2.jpg">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>MovieSHOP</h2>
            <p>혹 찾으시는 영화가 없다면 영화요청게시판에 요청하세요! 최대한 빠른 시간에 여러분께 해당 영화를 제공하기 위해 노력하겠습니다.</p>
        </div>	
      </div>
    </div>
    
   </div>
   	     
		</div>
	</div>
</div>
</div>
</section>
</body>
</html>