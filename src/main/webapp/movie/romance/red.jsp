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
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="../romance.jsp">이전페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="../main.jsp">홈</a></li>
				  </ul>
            </div>
        </nav>
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                 <img class="img-fluid rounded mb-4 mb-lg-0" src="../images/red.jpg" height="600px" />
                </div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">레드</h1>
                    <p>평점 8 | 123분 | 15세 </p>                    
                    <p>토코는 상류층 집안의 남편 그리고 귀여운 딸과 함께 남부럽지 않은 삶을 사는 것처럼 보인다. 그러던 어느 날 10년 만에 옛 애인인 건축가 구라타와 우연히 재회를 하고, 마음속 깊이 간직했던 복잡한 감정이 조금씩 되살아나며 무미건조했던 그녀의 일상에는 큰 변화가 찾아온다.</p>
                    <a class="btn btn-primary" href="#!">시청하기</a>
                </div>
            </div>
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">본 영화는 저작권법에 의하여 보호되는 저작물로서, 사적 이용 범위에서만 이용이 가능합니다.</p></div>
            </div>
           </div>
</body>
</html>