<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link href="//cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/js/foundation.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
body {
    color: #6d7679;
    font-family: arial;
    font-weight: normal;
    line-height: 1.5;
}
.section-medium {
    background-color: #edf0f1;
    padding: 3rem 0;
}
h3 {
    font-size: 1.5rem;
}
h3 {
    font-size: 1.3125rem;
    line-height: 1.2;
    margin-bottom: 1rem;
    margin-top: 1rem;
}
section .column, section .columns {
    margin-bottom: 1rem;
}
img{
height: 550px;
}
img:hover {
  display: block; width: 120%; height: auto;
}
</style>
</head>
<body>
<section class="section-medium">
    <div class="row">
        <div class="columns large-12 text-center">
            <h2>액션</h2>
        </div>
    </div>
    <div class="row small-up-1 medium-up-3">
        <div class="column column-block">
            <a href="thriller/rang.jsp"><img src="images/rang.jpg" class="img-responsive"></a>
            <h3>랑종</h3>
            <p>2021</p>
        </div>
        <div class="column column-block">
            <a href="thriller/chang.jsp"><img src="images/chang.jpg" alt="" class="img-responsive"></a>
            <h3>창궐</h3>
            <p>2018</p>
        </div>
        <div class="column column-block">
            <a href="thriller/zombi.jsp"><img src="images/zombi.jpg" alt="" class="img-responsive"></a>
            <h3>좀비 사파리</h3>
            <p>2021</p>
        </div>
        <div class="column column-block">
            <a href="thriller/night.jsp"><img src="images/night.jpg" alt="" class="img-responsive"></a>
            <h3>나이트 언데드</h3>
            <p>2021</p>
        </div>      
        <div class="column column-block">
            <img src="images/f20.jpg" alt="" class="img-responsive">
            <h3>F20</h3>
            <p>2022</p>
        </div>    
        <div class="column column-block">
             <a href="thriller/busan.jsp"><img src="images/busan.jpg" alt="" class="img-responsive"></a>
            <h3>부산행</h3>
            <p>2016</p>
        </div>    
        <div class="column column-block">
            <img src="images/under.jpg" alt="" class="img-responsive">
            <h3>언더샤크</h3>
            <p>2022</p>
        </div>    
        <div class="column column-block">
            <img src="images/happy.jpg" alt="" class="img-responsive">
            <h3>해피 데스나이트</h3>
            <p>2019</p>
        </div>    
         <div class="column column-block">
            <img src="images/wife.jpg" alt="" class="img-responsive">
            <h3>아내를 죽였다</h3>
            <p>2019</p>
        </div>                                             
    </div>
</section>
</body>
</html>