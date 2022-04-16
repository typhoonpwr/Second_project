<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">	
.row1 {
	height: 500px;
	width: 100%;
	margin: 0px auto;
	margin-top: 10px;
}
.box1,.box2,.box3,.box4 {
	position: relative;
	width: 1500px;
	height: 550px;
	margin: 0px auto;
	left: -50px;
	text-align: center;
}
.overflow1,.overflow2,.overflow3,.overflow4 {
	position: relative;
	float: left;
	margin: 0px auto;
	padding-top: 30px;
	width: 1355px;
	height: 550px;
	overflow: hidden;
	text-align: center;
}
.oneRank1,.oneRank2,.oneRank3,.oneRank4 {
	top: 100px;
	display: inline-block;
	margin-top: 60px;
	margin: 40px auto;
	width: 250px;
	height: 450px;
	text-align: center;
	border: none;
	outline: none;
}
.lefter1 {
	position: absolute;
	float:left;
    top: 36%;
    left: -40px;
}
.lefter2 {
	position: absolute;
	float:left;
    top: 42%;
    left: -40px;
}
.lefter3 {
	position: absolute;
	float:left;
    top: 50%;
    left: -40px;
}
.lefter4 {
	position: absolute;
	float:left;
    top: 57%;
    left: -40px;
}
.righter1,.righter2,.righter3,.righter4 {
	position: relative;
	float: right;
	top: 35%;
	left: -100px;
}
.title1 {
	height: 40px;
	padding-top: 100px;
	font-family: 'Noto Sans KR', sans-serif;
}
.card-img-top {
	border-radius: 5px;
	width: 280px;
	height: 193px;
}
.card-title {
font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;

line-height: 39px;

color: #27243A;
margin-bottom: -22px;
}
strong{
	left: -50px;
	position: relative;
}
.card-text {
	font-family: 'Noto Sans KR', sans-serif;
}

.go-top {
  position:fixed;
  bottom: 0px;
  right:0px;
  padding:50px;
  display:none;
  cursor: pointer;
}
.go-top:after {
  content: '▲';
  color: #000;
  /* position: absolute; 
  bottom:80px;
  left: 4500%;
  font-size: 32px; */
  display: inline-block;
    
    background-position: -150px -212px;
    background-repeat: no-repeat;
    vertical-align: top;
    font-size: 32px;
    
}

div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:105px;top:47.5%;margin-top:200px;right:10px;background:#fff;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:13.5pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}

</style>
</head>
<body>
	<section class="container">
		<!-- 로그인 되었을때만 나타나게 해야함 -->
		<c:if test="${sessionScope.id!=null }">  
		<div class="row1">
			<h3 class="title1">
				<strong>내가 가입한 동아리</strong>
			</h3>
			<div class="box1">
				<img class="lefter1" src="../resources/img/화살표.png">
				<div class="overflow1">
					<c:forEach var="vo" items="${list2 }">
						<div class="oneRank1">
							<img src="${vo.cl_poster }" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">${vo.cl_name }</h5>
								<br>
								<p class="card-text">${vo.cl_content }</p>
								<a href="/puzzle/${vo.cl_no }/main.do" class="btn btn-primary"
									style="background-color: #3a65ef">퍼즐 참가하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<img class="righter1" src="../resources/img/화살표2.png">
			</div>
		</div>
		</c:if>
		  
		<div class="row1">
			<h3 class="title1">
				<strong>마감 임박 퍼즐</strong>
			</h3>
			<div class="box2">
				<img class="lefter2" src="../resources/img/화살표.png">
				<div class="overflow2">
					<c:forEach var="vo" items="${list3 }" >
						<div class="oneRank2">
							<img src="${vo.cl_poster }" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">${vo.cl_name }</h5>
								<br>
								<p class="card-text">${vo.cl_content }</p>
								<a href="/puzzle/${vo.cl_no }/main.do" class="btn btn-primary"
									style="background-color: #3a65ef">퍼즐 참가하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<img class="righter2" src="../resources/img/화살표2.png">
			</div>
		</div>

		

		<div class="row1">
			<h3 class="title1">
				<strong>추천 동아리</strong>
			</h3>
			<div class="box4">
				<img class="lefter4" src="../resources/img/화살표.png">
				
				<div class="overflow4">
					<c:forEach var="vo" items="${list }" >
						<div class="oneRank4">
							<img src="${vo.cl_poster }" class="card-img-top">
							<div class="card-body">
								<h5 class="card-title">${vo.cl_name }</h5>
								<br>
								<p class="card-text">${vo.cl_content }</p>
								<a href="/puzzle/${vo.cl_no }/main.do" class="btn btn-primary"
									style="background-color: #3a65ef">동아리 구경하기</a>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<img class="righter4" src="../resources/img/화살표2.png">
			</div>
		</div>
		
		
		
		
		<div class="go-top"></div>
		<div class="quickmenu">
		  <ul>
		    <li><a href="/mainboard/main_go.do">공지사항</a></li>
		    <li><a href="/mainboard/main_go.do">Q&A</a></li>
		    <li><a href="/mainboard/main_go.do">1:1질문</a></li>
		  </ul>
		</div>
		
		
		          <script type="text/javascript"
			src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script>
		$(document).ready(function() {
			$('.overflow1').slick({
				prevArrow : $(".lefter1"),
				nextArrow : $(".righter1"),
				infinite : true,
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 3
			});
		});
		$(document).ready(function() {
			$('.overflow2').slick({
				prevArrow : $(".lefter2"),
				nextArrow : $(".righter2"),
				infinite : true,
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 3
			});
		});
		$(document).ready(function() {
			$('.overflow3').slick({
				prevArrow : $(".lefter3"),
				nextArrow : $(".righter3"),
				infinite : true,
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 3
			});
		});
		$(document).ready(function() {
			$('.overflow4').slick({
				prevArrow : $(".lefter4"),
				nextArrow : $(".righter4"),
				infinite : true,
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 3
			});
		});
			
			$(function(){

				  //Scroll event
				  $(window).scroll(function(){
				    var scrolled = $(window).scrollTop();
				    if (scrolled > 200) $('.go-top').fadeIn('slow');
				    if (scrolled < 200) $('.go-top').fadeOut('slow');
				  });
				  
				  //Click event
				  $('.go-top').click(function () {
				    $("html, body").animate({ scrollTop: "0" },  500);
				  });

				});
			
			$(document).ready(function(){
				  var currentPosition = parseInt($(".quickmenu").css("top"));
				  $(window).scroll(function() {
				    var position = $(window).scrollTop(); 
				    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
				  });
				});
			
		
		</script>
		
		
	</section>
	
	
</body>
</html>