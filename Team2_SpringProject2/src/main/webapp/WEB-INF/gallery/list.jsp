<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#gallerytitle{
	text-decoration: none;
	color: black;
}
#gallerytitle:hover {
	text-decoration: underline;
	color:blue;
}
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 20px;">
			<div class="row">
				<table class="table">
					<tr>
						<td class="text-left">
							<h2>갤러리 게시판</h2>
						</td>
						<td class="text-right">
							<%-- 가입한 동아리인 사람에게만 보이게 작업 --%>
							<a href="insert.do" class="btn btn-info" style="margin-right: -100px;">새글쓰기</a>
						</td>
					</tr>
				</table>
				<div class="table-responsive"
					style="height: 560px;">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" width="5%">번호</th>
								<th scope="col" width="60%">제목</th>
								<th scope="col" width="15%">작성자</th>
								<th scope="col" width="15%">작성일</th>
								<th scope="col" width="5%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="${count }" />
							<c:forEach var="vo" items="${list }">
							<tr>
								<td>${count }</td>
								
								<td><a href="../gallery/detail.do?b_no=${vo.b_no }" id="gallerytitle">${vo.b_title }</a>&nbsp;
									<c:if test="${today==vo.dbday }">
										<sup style="color:red;">new</sup>
									</c:if>
								</td>
								<td>${vo.id }</td>
								<td>${vo.dbday }</td>
								<td>${vo.b_hit }</td>
							</tr>
							<c:set var="count" value="${count-1 }" />
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-7">
						<form method="post" action="find.do">
							<input type="checkbox" name="fs" value="N">
							이름 <input type="checkbox" name="fs" value="S">
							제목 <input type="checkbox" name="fs" value="C">
							내용 <input type="text" size="15" class="input-sm" name="ss"> 
							<input type="submit" value="검색" class="btn btn-sm btn-info">
						</form>
					</div>
					<div class="col-sm-5">
						<ul class="pagination" style="float: right;">
							<c:if test="${startPage>1 }">
							<li class="page-item"><a class="page-link" href="../gallery/list.do?page=${startPage-1 }">&laquo;
									</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i==curpage }">
									<c:set var="style" value="class=current" />
								</c:if>
								<c:if test="${i!=curpage }">
									<c:set var="style" value="" />
								</c:if>
							<li class="page-item" ${style }><a class="page-link" href="../gallery/list.do?page=${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${endPage<totalpage }">
							<li class="page-item"><a class="page-link" href="../gallery/list.do?page=${endPage+1 }">
									&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>