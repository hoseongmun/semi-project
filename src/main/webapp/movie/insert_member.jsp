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
<script type="text/javascript">

$(function() {
	$("#btnSave").click(function() {
		insert();
	});
});


function insert() {
	var param = "userid="+$("#userid").val()+"&passwd="+$("#passwd").val()+
		"&name="+$("#name").val()+"&email="+$("#email").val()+"&hp="+$("#hp").val();
	$.ajax({
		type: "post",
		url: "/jsp02/members_servlet/join.do",
		data: param,
		success: function(){
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");			
		}
	});
}


function check(){
	
	//아이디 처리
	var userid = document.getElementById("userid");
	if(userid.value == ""){
		alert("아이디는 필수 입력입니다.");
		userid.focus();
		return;
	}
	
	var passwd1 = document.getElementById("passwd");
	var passwd2 = document.getElementById("passwd2");
	if(passwd.value == ""){
		alert("비밀번호는 필수 입력입니다.");
		passwd.focus();
		return;
	}
	if(passwd.value !=passwd2.value){
		alert("비밀번호가 다릅니다.");
		passwd2.focus();
		return;
	}
	
	var name = document.getElementById("name");
	if(name.value == ""){
		alert("이름은 필수 입력입니다.");
		name.focus();
		return;
	}
	alert("정상 가입되었습니다.");
}	
	
$(document).ready(function(){

	  $("input").focus(function(){
	    $(this).parent().find(".label-txt").addClass('label-active');
	  });

	  $("input").focusout(function(){
	    if ($(this).val() == '') {
	      $(this).parent().find(".label-txt").removeClass('label-active');
	    };
	  });

	});
	
</script>
<style type="text/css">

body {
  background: #C5E1A5;
}
form {
  width: 60%;
  margin: 60px auto;
  background: #efefef;
  padding: 60px 120px 80px 120px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
label {
  display: block;
  position: relative;
  margin: 40px 0px;
}
.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
}
.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #8BC34A;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}

.label-active {
  top: -3em;
}

button {
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

button:hover {
  background: #8BC34A;
  color: #ffffff;
}
</style>
</head>
<body>
<form>
  <label>
    <p class="label-txt">아이디</p>
    <input type="text" class="input" id="userid">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">비밀번호</p>
    <input type="password" class="input" id="passwd">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">비밀번호확인</p>
    <input type="password" class="input" id="passwd2">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>  
  <label>
    <p class="label-txt">이름</p>
    <input type="text" class="input" id="name">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">HP</p>
    <input type="text" class="input" id="hp">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>  
    
  <label>
    <p class="label-txt">이메일</p>
    <input type="text" class="input" id="email">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label> 
     
  <button type="submit" onclick="check()" id="btnSave" >회원가입</button>
</form>
</body>
</html>