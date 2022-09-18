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
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="../comedy.jsp">이전페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="../main.jsp">홈</a></li>
				  </ul>
            </div>
        </nav>
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                 <img class="img-fluid rounded mb-4 mb-lg-0" src="../images/hubo.jpg" height="600px" />
                </div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">정직한 후보</h1>
                    <p>평점 8.33 | 104분 | 12세 </p>                    
                    <p>거짓말이 제일 쉬운 3선 국회의원 ‘주상숙’에게 청천벽력이 떨어진다. 하루아침에 거짓말은 1도 할 수 없는 ‘진실의 주둥이’를 갖게 된 것! 최고의 무기인 ‘거짓말’을 잃자 그녀의 인생은 송두리째 흔들리게 되는데...</p>
                    <a class="btn btn-primary" href="#!">시청하기</a>
                </div>
            </div>
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">본 영화는 저작권법에 의하여 보호되는 저작물로서, 사적 이용 범위에서만 이용이 가능합니다.</p></div>
            </div>
           </div>
</body>
</html>