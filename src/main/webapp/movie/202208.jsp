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
            <h2>8월 인기 영화</h2>
        </div>
    </div>
    <div class="row small-up-1 medium-up-3">
        <div class="column column-block">
            <a href="action/bete.jsp"><img src="images/bete.jpg" class="img-responsive"></a>
            <h3>베테랑</h3>
            <p>2015</p>
        </div>
        <div class="column column-block">
            <a href="action/city.jsp"><img src="images/city.jpg" alt="" class="img-responsive"></a>
            <h3>범죄도시</h3>
            <p>2017</p>
        </div>
        <div class="column column-block">
            <a href="action/topgun.jsp"><img src="images/topgun.jpg" alt="" class="img-responsive"></a>
            <h3>탑건</h3>
            <p>2022</p>
        </div>
        <div class="column column-block">
            <a href="action/gonh.jsp"><img src="images/gonh.jpg" alt="" class="img-responsive"></a>
            <h3>공조2</h3>
            <p>2022</p>
        </div>      
        <div class="column column-block">
            <img src="images/di.jpg" alt="" class="img-responsive">
            <h3>특송</h3>
            <p>2022</p>
        </div>    
        <div class="column column-block">
             <a href="action/gonh.jsp"><img src="images/hunt.jpg" alt="" class="img-responsive"></a>
            <h3>헌트</h3>
            <p>2022</p>
        </div>    
        <div class="column column-block">
            <img src="images/gong1.jpg" alt="" class="img-responsive">
            <h3>공조</h3>
            <p>2017</p>
        </div>    
        <div class="column column-block">
            <img src="images/devil.jpg" alt="" class="img-responsive">
            <h3>다만 악에서 구하소서</h3>
            <p>2020</p>
        </div>    
         <div class="column column-block">
            <img src="images/moga.jpg" alt="" class="img-responsive">
            <h3>모가디슈</h3>
            <p>2022</p>
        </div>                                             
    </div>
</section>
</body>
</html>