<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.advertise {
	position: relative; width =100%; height =100%; text-align =center;
	background-color: #3d6aec;
	overflow: hidden;
}
.wrap{
	display: block;
	position: relative;
	left:0px;
}

.advertise img {
	display: block;
	position: relative;
	margin: 0px auto;
}

body {
	padding: 20px;
	background: #eee;
	user-select: none;
}

[type=radio] {
	display: none;
}

#slider {
	width:750px;
	height: 950px;
	position: absolute;
	top:300px;
	left:100px;
	perspective: 1000px;
	transform-style: preserve-3d;
}

#slider label {
	margin: auto;
	width: 280px;
	height: 300px;
	border-radius: 8px;
	position: absolute;
	left: 0;
	right: 0;
	cursor: pointer;
	transition: transform 0.4s ease;
}

#s1:checked ~ #slide4, #s2:checked ~ #slide5, #s3:checked ~ #slide1, #s4:checked 
	~ #slide2, #s5:checked ~ #slide3 {
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, .37);
	transform: translate3d(-80%, -45%, -200px);
}

#s1:checked ~ #slide5, #s2:checked ~ #slide1, #s3:checked ~ #slide2, #s4:checked 
	~ #slide3, #s5:checked ~ #slide4 {
	box-shadow: 0 6px 10px 0 rgba(0, 0, 0, .3), 0 2px 2px 0
		rgba(0, 0, 0, .2);
	transform: translate3d(-40%, -25%, -70px);
}

#s1:checked ~ #slide1, #s2:checked ~ #slide2, #s3:checked ~ #slide3, #s4:checked 
	~ #slide4, #s5:checked ~ #slide5 {
	box-shadow: 0 13px 25px 0 rgba(0, 0, 0, .3), 0 11px 7px 0
		rgba(0, 0, 0, .19);
	transform: translate3d(0, 0, 100px);
}

#s1:checked ~ #slide2, #s2:checked ~ #slide3, #s3:checked ~ #slide4, #s4:checked 
	~ #slide5, #s5:checked ~ #slide1 {
	box-shadow: 0 6px 10px 0 rgba(0, 0, 0, .3), 0 2px 2px 0
		rgba(0, 0, 0, .2);
	transform: translate3d(40%, -25%, -70px);
}

#s1:checked ~ #slide3, #s2:checked ~ #slide4, #s3:checked ~ #slide5, #s4:checked 
	~ #slide1, #s5:checked ~ #slide2 {
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, .37);
	transform: translate3d(80%, -45%, -200px);
	transform: rgba(0,0,0,0.3);
}

#slide1 {
	background: white
}

#slide2 {
	background: white
}

#slide3 {
	background: white
}

#slide4 {
	background: white
}

#slide5 {
	background: white
}


.waving{
position:absolute;
transform: rotate(90deg);
top:280px;
left:300px;
}
.whitebox{
position:absolute;
background: white;
top:-30px;

width:900px;
height:800px;
}


.flex { /*Flexbox for containers*/
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.waves {

  position:relative;
  top:-175px;
  width: 100%;
  height:15vh;
  margin-bottom:-7px; /*Fix for safari gap*/
  min-height:100px;
  max-height:150px;
}

.content {
  position:relative;
  height:20vh;
  text-align:center;
  background-color: white;
}

/* Animation */

.parallax > use {
  animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
}
.parallax > use:nth-child(1) {
  animation-delay: -2s;
  animation-duration: 7s;
  background: white;
  opacity: 100;
}
.parallax > use:nth-child(2) {
  animation-delay: -3s;
  animation-duration: 10s;
  background: white;
  opacity: 100;
}
.parallax > use:nth-child(3) {
  animation-delay: -4s;
  animation-duration: 13s;
  background: white;
  opacity: 100;
}
.parallax > use:nth-child(4) {
  animation-delay: -5s;
  animation-duration: 20s;
  background: white;
  opacity: 100;
}
@keyframes move-forever {
  0% {
   transform: translate3d(-90px,0,0);
  }
  100% { 
    transform: translate3d(85px,0,0);
  }
}
body{
	padding: 0px;
}
.recClubpic{
width:280px;
height:200px;
border-radius: 8px 8px 0px 0px;
}
.recName{
position:absolute;
font-size: 26px;
font-weight: 900px;
line-height: 55px;
color:#568bff;
left:20px;
}
.recInfo{
position:absolute;
font-size: 17px;
font-weight: 900px;
line-height: 50px;
color:gray;
bottom:8px;
left:20px;
}
.recCate{
position:absolute;
font-size: 17px;
font-weight: 900px;
line-height: 50px;
color:gray;
bottom:8px;
right:20px;
}
.recBtn{
position:absolute;
width:80px;
height:28px;
border:none;
border-radius: 8px;
background-color: #fdbe51;
color:white;
top:215px;
right:20px;

}
</style>

</head>
<body>
	<div class="advertise">
	<div class="waving">
	<div class="whitebox"></div>
<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
<defs>
<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
</defs>
<g class="parallax">
<!-- <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,1" />
<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.7)" /> -->
<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.7)" /> 
<use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
</g>
</svg>
</div>
		<div class="wrap">
		<img alt="" src="../resources/img/header_no.png">
		<section id="slider">
			<input type="radio" name="slider" id="s1">
			<input type="radio" name="slider" id="s2"> 
			<input type="radio" name="slider" id="s3" checked> 
			<input type="radio" name="slider" id="s4"> 
			<input type="radio" name="slider" id="s5"> 
			<%-- <c:if test="${sessionScope.id!=null }"> --%>
			<label for="s1" id="slide1">
				<img class="recClubpic" src="${vo1.cl_poster }">
				<div class="recName">${vo1.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${vo1.cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo1.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo1.cl_head }명</div>
				<div class="recCate">${vo1.cl_category }</div>
			</label> 
			<label for="s2" id="slide2">
				<img class="recClubpic"  src="${vo2.cl_poster }">
				<div class="recName">${vo2.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${vo2.cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo2.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo2.cl_head }명</div>
				<div class="recCate">${vo2.cl_category }</div>
			</label> 
			<label for="s3" id="slide3">
				<img class="recClubpic"  src="${vo3.cl_poster }">
				<div class="recName">${vo3.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${vo3.cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo3.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo3.cl_head }명</div>
				<div class="recCate">${vo3.cl_category }</div>
			</label> 
			<label for="s4" id="slide4">
				<img class="recClubpic"  src="${vo4.cl_poster }">
				<div class="recName">${vo4.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${vo4.cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo4.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo4.cl_head }명</div>
				<div class="recCate">${vo4.cl_category }</div>
			</label> 
			<label for="s5" id="slide5">
				<img class="recClubpic"  src="${vo5.cl_poster }">
				<div class="recName">${vo5.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${vo5.cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo5.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo5.cl_head }명</div>
				<div class="recCate">${vo5.cl_category }</div>
			</label>
			<%-- </c:if> --%>
			
			<%-- <c:if test="${sessionScope.id==null }">
			 <label for="s1" id="slide1">
				<img class="recClubpic" src="${vo_1.cl_poster }">
				<div class="recName">${vo_1.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo_1.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo_1.cl_head }명</div>
				<div class="recCate">${vo_1.cl_category }</div>
			</label>  
			<label for="s2" id="slide2">
				<img class="recClubpic"  src="${vo_2.cl_poster }">
				<div class="recName">${vo_2.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo_2.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo_2.cl_head }명</div>
				<div class="recCate">${vo_2.cl_category }</div>
			</label> 
			<label for="s3" id="slide3">
				<img class="recClubpic"  src="${vo_3.cl_poster }">
				<div class="recName">${vo_3.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo_3.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo_3.cl_head }명</div>
				<div class="recCate">${vo_3.cl_category }</div>
			</label> 
			<label for="s4" id="slide4">
				<img class="recClubpic"  src="${vo_4.cl_poster }">
				<div class="recName">${vo_4.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo_4.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo_4.cl_head }명</div>
				<div class="recCate">${vo_4.cl_category }</div>
			</label> 
			<label for="s5" id="slide5">
				<img class="recClubpic"  src="${vo_5.cl_poster }">
				<div class="recName">${vo_5.cl_name }</div>
				<button class="recBtn"><a href="/puzzle/${cl_no}/main.do">둘러보기</a></button>
				<div class="recInfo">${vo_5.cl_loc }&nbsp;&nbsp;|&nbsp;&nbsp;${vo_5.cl_head }명</div>
				<div class="recCate">${vo_5.cl_category }</div>
			</label>
			</c:if> --%>
		</section>
		</div>
	</div>
</body>
</html>