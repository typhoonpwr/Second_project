<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#calendar {
    width: 100%;	
}
#calendar .weekdays {
	height: 40px;
	background: #fdbe51;
}
#calendar td,th {
	display: block;
	float: left;
	width:14.342%;
	padding: 5px;
	box-sizing:border-box;
	border: 1px solid #ccc;
	margin-right: -1px;
	margin-bottom: -1px;
}
#calendar td{
	height: 100px;
}
#calendar #galtext {
	float: right;
}
.puzzletool{
	line-height: 7px;
}
.pcontent{
	height: 202px;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
		$('.puzzlelist').hover(function() {
			$(this).css("cursor","pointer");
			$(this).css("color","blue");
			$(this).css("textDecoration","underline");
		},function() {
			$(this).css("cursor","none");
			$(this).css("color","black");
			$(this).css("textDecoration","none");
		})
		
		$('.puzzlelist').click(function(){
			let pl=$(this).attr("data-value");
			let cl=$(this).attr("data-value2");
			
			$.ajax({
				type:'get',
				url:'../galendar/puzzle.do',
				data:{
					"p_no":pl,
					"cl_no":cl
					},
				success:function(res) {
					$('.pcontent').html(res);
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="container-fluid" style="padding: 0px;">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 20px;">
			<div class="row m-top-30">
				<h2 class="text-left">${year }년${month }월 모임일정</h2>
				<br>
				<div class="col-md-12 text-center" id="calendar">
					<br>
					<%-- 달력 출력 request.setAttribute("week", week);--%>
					<c:set var="week" value="${week }" />
					<c:set var="dd" value="${dList }" />
					<table class="table">
						<tr>
							<c:forEach var="strWeek" items="${strWeek }">
								<th class="text-center weekdays">${strWeek }</th>
							</c:forEach>
						</tr>
						<c:forEach var="i" begin="1" end="${lastday }">
							<c:if test="${i==1 }">
								<tr class="days">
									<c:forEach var="j" begin="1" end="${week }">
										<td class="text-center">&nbsp;</td>
									</c:forEach>
							</c:if>
							<td class="text-center"><b id="galtext">${i }</b>
								<br>
								<c:forEach var="vo" items="${pList }">
									<c:if test="${vo.dbday==i }">
										<div class="puzzletool">
											<c:if test="${i>=strDay }">
												<p style="float: left;" class="puzzlelist" data-value="${vo.p_no }" data-value2="${vo.cl_no }">[${vo.p_loc}]${vo.p_title }
											</c:if>
											<c:if test="${i<strDay }">
												<p style="float: left;" data-value="${vo.p_no }" data-value2="${vo.cl_no }">[${vo.p_loc}]${vo.p_title }
											</c:if>
										</div>
									</c:if>
								</c:forEach></td>
							<c:set var="week" value="${week+1 }" />
							<%--요일 변경 --%>
							<c:if test="${week>6 }">
								<c:set var="week" value="0" />
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="pcontent">
				
				</div>
			</div>
		</main>
	</div>
</body>
</html>