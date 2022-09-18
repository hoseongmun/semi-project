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
            <h2>코메디</h2>
        </div>
    </div>
    <div class="row small-up-1 medium-up-3">
        <div class="column column-block">
            <a href="comedy/mission.jsp"><img src="images/mission.jpg" class="img-responsive"></a>
            <h3>미션파서블</h3>
            <p>2021</p>
        </div>
        <div class="column column-block">
            <a href="comedy/hubo.jsp"><img src="images/hubo.jpg" alt="" class="img-responsive"></a>
            <h3>정직한 후보</h3>
            <p>2020</p>
        </div>
        <div class="column column-block">
            <img src="images/lucky.jpg" alt="" class="img-responsive">
            <h3>럭키</h3>
            <p>2016</p>
        </div>
        <div class="column column-block">
             <a href="comedy/sidong.jsp"><img src="images/sidong.jpg" alt="" class="img-responsive"></a>
            <h3>시동</h3>
            <p>2019</p>
        </div>      
        <div class="column column-block">
            <img src="images/tiger.jpg" alt="" class="img-responsive">
            <h3>타이거 마스크</h3>
            <p>2021</p>
        </div>    
        <div class="column column-block">
            <img src="images/per.jpg" alt="" class="img-responsive">
            <h3>퍼펙트맨</h3>
            <p>2019</p>
        </div>    
        <div class="column column-block">
            <img src="images/showme.jpg" alt="" class="img-responsive">
            <h3>쇼미더고스트</h3>
            <p>2021</p>
        </div>    
        <div class="column column-block">
            <img src="images/mrlee.jpg" alt="" class="img-responsive">
            <h3>힘을 내요, 미스터 리</h3>
            <p>2019</p>
        </div>    
         <div class="column column-block">
            <img src="images/mrjoo.jpg" alt="" class="img-responsive">
            <h3>미스터 주 : 사라진 VIP</h3>
            <p>2020</p>
        </div>                                             
    </div>
</section>
</body>
</html>