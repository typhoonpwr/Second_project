<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
button a{
color:white;
text-decoration: none;
}

button a:hover{
color:white;
text-decoration: none;
font-weight: 500px;
}

#search-bar{
width: 230px;
    height: 38px;
    position: absolute;
    right: 320px;
}

.d-flex{
width: 300px;
}
.logoM{
position:relative;
top:-5px;
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<header class="sticky-top bg-dark flex-md-nowrap p-0"
			style="border: 0.5px solid rgb(183, 181, 181)">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="/main/main.do"> <img src="/resources/img/logo.png"
						width="95" height="35"
						class="logoM">
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									카테고리 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="/category/cooklist.do">요리 / 제조</a></li>
									<li><a class="dropdown-item" href="/category/triplist.do">아웃도어 / 여행</a></li>
									<li><a class="dropdown-item" href="/category/sportslist.do">운동 / 스포츠</a></li>
									<li><a class="dropdown-item" href="/category/humanitylist.do">인문학 / 책 / 글</a></li>
									<li><a class="dropdown-item" href="/category/worklist.do">업무 / 직무</a></li>
									<li><a class="dropdown-item" href="/category/languagelist.do">외국 / 언어</a></li>
									<li><a class="dropdown-item" href="/category/culturelist.do">문화 / 공연 / 축제</a></li>
									<li><a class="dropdown-item" href="/category/musiclist.do">음악 / 악기</a></li>
									<li><a class="dropdown-item" href="/category/makelist.do">공예 / 만들기</a></li>
									<li><a class="dropdown-item" href="/category/dancelist.do">댄스 / 무용</a></li>
									<li><a class="dropdown-item" href="/category/volunteerlist.do">봉사활동</a></li>
									<li><a class="dropdown-item" href="/category/friendlist.do">사교 / 인맥</a></li>
									<li><a class="dropdown-item" href="/category/carlist.do">차 / 오토바이</a></li>
									<li><a class="dropdown-item" href="/category/photolist.do">사진 / 영상</a></li>
									<li><a class="dropdown-item" href="/category/gamelist.do">게임 / 오락</a></li>
									<li><a class="dropdown-item" href="/category/petlist.do">반려동물</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link" href="/mainboard/main_go.do">공지사항&nbsp;/&nbsp;QnA</a></li>
							<!-- <li class="nav-item"><a class="nav-link" href="/mainboard/main_go.do">공지사항/QnA</a></li> -->
						</ul>
						<div class="d-flex" style="width:25vw">
						 <form action="/search/search_find.do" method="get" class="search-form">
							<input type="text" id="search-bar" name="ss"
							placeholder="검색할 내용을 입력해 주세요." style="margin-right:180px;height:40px;" >
							<input type="submit" value="검색" class="btn btn-sm btn-primary" style="height:40px;">
						</form> 
							<c:if test="${sessionScope.id==null }">
                  <button class="btn btn-primary"
                     style="width: 20%; margin-left: 30px; margin-right: 10px;" ><a href="/member/log_in_move.do">로그인</a></button>
                  <button class="btn btn-primary" style="width: 20%;"><a href="/member/sign_up.do">회원가입</a></button>
               	  </c:if>
                  <c:if test="${sessionScope.id!=null }">
                  <button class="btn btn-primary" style="width: 40%%; margin-left: 10px;"><a href="/club/club.do">동아리 생성</a></button>
                  <button class="btn btn-primary"
                     style="width: 20%; margin-left: 20px; margin-right: 10px;" ><a href="/member/log_out.do">로그아웃</a></button>
                  <button class="btn btn-primary" style="width: 40%%;"><a href="/mypage/mypage_go.do">마이페이지</a></button>
                  
                  </c:if>
						</div>
					</div>
				</div>
			</nav>
		</header>
	</div>
	
</body>
</html>