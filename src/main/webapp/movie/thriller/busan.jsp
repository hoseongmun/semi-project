<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
<style type="text/css">

body {
 background: black;
 color: white;
}

</style>
</head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="#!">MovieSHOP</a>
                  <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="../thriller.jsp">이전페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="../main.jsp">홈</a></li>
				  </ul>
            </div>
        </nav>
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                 <img class="img-fluid rounded mb-4 mb-lg-0" src="../images/busan.jpg" height="600px" />
                </div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">부산행</h1>
                    <p>평점 8.59 | 118분 | 15세 </p>                    
                    <p>전대미문의 재난이 대한민국을 덮친다!
정체불명의 바이러스가 전국으로 확산되고 대한민국 긴급재난경보령이 선포된 가운데, 열차에 몸을 실은 사람들은 단 하나의 안전한 도시 부산까지 살아가기 위한 치열한 사투를 벌이게 된다. 서울에서 부산까지의 거리 442KM 지키고 싶은, 지켜야만 하는 사람들의 극한의 사투!</p>
                    <a class="btn btn-primary" href="#!">시청하기</a>
                </div>
            </div>
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">본 영화는 저작권법에 의하여 보호되는 저작물로서, 사적 이용 범위에서만 이용이 가능합니다.</p></div>
            </div>
           </div>
</body>
</html>