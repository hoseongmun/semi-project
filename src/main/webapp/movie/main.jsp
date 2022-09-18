<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>main</title>
<%@ include file="../include/header.jsp" %>

<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
  </head>
  <body>
    
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="btn btn-sm btn-outline-secondary" href="admin_login.jsp">관리자 로그인</a>        
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="#">movie shop</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="btn btn-sm btn-outline-secondary" href="member_login.jsp">회원 로그인</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="action.jsp">액션</a>
      <a class="p-2 link-secondary" href="comedy.jsp">코미디</a>
      <a class="p-2 link-secondary" href="romance.jsp">로맨스</a>
      <a class="p-2 link-secondary" href="thriller.jsp">스릴러</a>
      <a class="p-2 link-secondary" href="${path}/movie_servlet/list.do">영화요청게시판</a>
      <a class="p-2 link-secondary" href="${path}/cart_servlet/list.do">장바구니</a>      
    </nav>
  </div>
</div>

<main class="container">
  <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
    <div class="col-md-10 px-0">
      <h2 class="display-3 fst-italic">무비샵 영화 스트리밍 서비스</h2>
      <p class="lead my-3">저희 무비샵에서는 최신 영화부터 시작하여 흑백영화에 이르기까지 다양한 영화 전문 스트리밍서비스를 하고 있습니다. 
      혹 원하는 영화가 없다면 요청게시판에 요청을 남겨주세요. 요청하시는 영화를 최대한 빠르게 서비스할 수 있도록 노력하고 있습니다.</p>
      <p class="lead mb-0"><a href="${path}/movie_servlet/list.do" class="text-white fw-bold">요청 게시판 바로가기</a></p>
    </div>
  </div>
  <p><h4 class="pb-4 mb-4 border-bottom text-danger">최신 업로드 영화</h4></p>
  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">액션</strong>
          <h3 class="mb-0">탑건 매버릭</h3>
          <div class="mb-1 text-muted">감독 조셉 코신스키</div>
          <p class="card-text mb-auto">한순간의 실수도 용납되지 않는 하늘 위, 가장 압도적인 비행이 시작된다!  그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만, 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다.</p>
          <a href="action/topgun.jsp" class="stretched-link">바로가기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
         <img src="images/topgun.jpg" class="bd-placeholder-img" width="200" height="300" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
         <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">코메디</strong>
          <h3 class="mb-0">미션 파서블</h3>
          <div class="mb-1 text-muted">감독 김형주</div>
          <p class="card-text mb-auto">“돈 되니까” VS “국가를 위해” 우린, 한다면 한다! 
          입금만 되면 뭐든 가능해지는 흥신소 사장 ‘우수한’ 앞에 어느 날 열정 충만 비밀 요원 ‘유다희’가 현금 천 만원과 함께 찾아 온다. 무기 밀매 사건을 해결하자며, 대놓고 공조를 요청해 온 것!</p>
          <a href="comedy/mission.jsp" class="stretched-link">바로가기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
         <img src="images/mission.jpg" class="bd-placeholder-img" width="200" height="300" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
        </div>
      </div>
    </div>
  </div>

  <div class="row mb-2">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 border-bottom">주간 인기 영화</h3>
<div
   id="carouselExampleIndicators"
   class="carousel slide"
   data-bs-ride="carousel">
   <div class="carousel-indicators">
      <button
         type="button"
         data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="0"
         class="active"
         aria-current="true"
         aria-label="Slide 1"></button>
      <button
         type="button"
         data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="1"
         aria-label="Slide 2"></button>
      <button
         type="button"
         data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="2"
         aria-label="Slide 3"></button>
   </div>
   <div class="carousel-inner">
      <div class="carousel-item active">
         <a href="action/topgun.jsp"><img src="images/topgun.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>
      <div class="carousel-item">
         <a href="action/hansan.jsp"><img src="images/hansan.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>
      <div class="carousel-item">
         <a href="action/gonh.jsp"><img src="images/gonh.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>
      <div class="carousel-item">
         <a href="action/hunt.jsp"><img src="images/hunt.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>      
   </div>
   <button
      class="carousel-control-prev"
      type="button"
      data-bs-target="#carouselExampleIndicators"
      data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
   </button>
   <button
      class="carousel-control-next"
      type="button"
      data-bs-target="#carouselExampleIndicators"
      data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
   </button>
</div>
</div>

     <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="fst-italic">구독비용</h4>
          <ul>
           <li>1년 100,000원</li>
           <li>1달 12,000원</li>
           <li>1일 5,000원</li>
          </ul>
          <p class="mb-0"> 구독관련 문의 : 02-123-4567</p>
        </div>

        <div class="p-4">
          <h4 class="fst-italic">월별 인기 영화</h4>
          <ol class="list-unstyled mb-0">
            <li><a href="202208.jsp">2022년 8월</a></li>
            <li><a href="202208.jsp">2022년 7월</a></li>
            <li><a href="202208.jsp">2022년 6월</a></li>
            <li><a href="202208.jsp">2022년 5월</a></li>
          </ol>
        </div>
      </div>
    </div>
   

  <div class="row mb-2">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 border-bottom">
      <br>
      
        온가족이 함께 보면 좋을 영화
      </h3>
<div
   id="carouselExampleIndicators"
   class="carousel slide"
   data-bs-ride="carousel">
   <div class="carousel-indicators">
      <button
         type="button"
         data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="0"
         class="active"
         aria-current="true"
         aria-label="Slide 1"></button>
      <button
         type="button"
         data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="1"
         aria-label="Slide 2" ></button>
      <button
         type="button"
         data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="2"
         aria-label="Slide 3"></button>
   </div>
   <div class="carousel-inner">
      <div class="carousel-item active">
         <a href="action/bete.jsp"><img src="images/bete.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>
      <div class="carousel-item">
         <a href="action/city.jsp"><img src="images/city.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>
      <div class="carousel-item">
         <a href="action/gonh.jsp"><img src="images/gonh.jpg" class="d-block w-100" width="300" height="700" /></a>
      </div>     
   </div>
   <button
      class="carousel-control-prev"
      type="button"
      data-bs-target="#carouselExampleIndicators"
      data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
   </button>
   <button
      class="carousel-control-next"
      type="button"
      data-bs-target="#carouselExampleIndicators"
      data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
   </button>
</div> 
</div>

    </div>
 </div>


</main>

<div class="mb-5 container-fluid">
    <hr>
    <p>ⓒ Movieshop
</div>
</footer>


    
  </body>
</html>