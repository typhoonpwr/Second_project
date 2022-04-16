<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.detaildesign {
	margin: 0px auto;
	width: 100%;
	border: 2px solid #fdbe51;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding:20px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delOk').click(function() {
			if (!confirm("정말로 삭제하시겠습니까?")) {
				return false;
			}
		})
	})
</script>
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
					</tr>
				</table>
				<div style="margin-top: 7px;"></div>
				<div class="detaildesign">
					<table class="table">
						<tr>
							<th class="text-center" width=20%>번호</th>
							<td class="text-center" width=30%>${vo.b_no }</td>
							<th class="text-center" width=20%>작성일</th>
							<td class="text-center" width=30%>${vo.dbday }</td>
						</tr>
						<tr>
							<th class="text-center" width=20%>아이디</th>
							<td class="text-center" width=30%>${vo.id }</td>
							<th class="text-center" width=20%>조회수</th>
							<td class="text-center" width=30%>${vo.b_hit }</td>
						</tr>
						<tr>
							<th class="text-center" width=20%>제목</th>
							<td colspan="3">${vo.b_title }</td>
						</tr>
						<c:if test="${vo.b_filecount!=0 }">
							<tr>
								<th class="text-center" width=20%>첨부파일</th>
								<td colspan="3"><c:forEach var="fdata" items="${fList }"
										varStatus="s">
										<li><a href="download.do?fn=${fdata }">${fdata }</a>(${sList[s.index] }Bytes)</li>
									</c:forEach></td>
							</tr>
						</c:if>
						<tr style="height: 100px;">
							<th class="text-center" width="20%">내용</th>
							<td class="text-start" valign="top" height="50" colspan="4"
								width="80%"><pre
									style="white-space: pre-wrap; border: none; background-color: white; overflow: auto; height: 100px; ">${vo.b_content }</pre>
							</td>
						</tr>
						<tr style="height: 290px;">
							<%-- 파일 이미지 출력 공간 --%>
							<c:forEach var="img" items="${iList }">
								<td class="text-center">
									<img src="${img }" style="width: 200px;height: 250px;">
								</td>
							</c:forEach>
						</tr>
						<tr>
							<td colspan="4" class="text-end">
								<c:if test="${sessionScope.id==vo.id }">
									<a href="update.do?no=${vo.b_no }" class="btn btn-sm btn-info">수정</a>
									<a href="delete_ok.do?no=${vo.b_no }" id="delOk" class="btn btn-sm btn-info">삭제</a>
								</c:if> 
								<a href="list.do" class="btn btn-sm btn-info">목록</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</main>
	</div>
	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>