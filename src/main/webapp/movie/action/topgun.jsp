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
                     <li class="nav-item"><a class="nav-link active" aria-current="page" href="../action.jsp">이전페이지</a></li>
                    <li class="nav-item"><a class="nav-link" href="../main.jsp">홈</a></li>
				  </ul>
            </div>
        </nav>
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="../images/topgun.jpg" alt="..." height="600px" /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">탑건</h1>
                    <p>평점 8.6 | 130분 | 15세 </p>                    
                    <p>한순간의 실수도 용납되지 않는 하늘 위, 가장 압도적인 비행이 시작된다!

최고의 파일럿이자 전설적인 인물 매버릭은 자신이 졸업한 훈련학교 교관으로 발탁된다. 그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만, 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다. 매버릭의 지휘 아래 견고한 팀워크를 쌓아가던 팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자 매버릭은 자신이 가르친 동료들과 함께 마지막이 될지 모르는 하늘 위 비행에 나서는데...</p>
                    <a class="btn btn-primary" href="#!">시청하기</a>
                </div>
            </div>
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">본 영화는 저작권법에 의하여 보호되는 저작물로서, 사적 이용 범위에서만 이용이 가능합니다.</p></div>
            </div>
           </div>
</body>
</html>