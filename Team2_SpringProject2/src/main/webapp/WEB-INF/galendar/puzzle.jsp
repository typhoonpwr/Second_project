<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>a
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'KeyWord', 'KeyWordCount' ],
				<c:forEach var="kvo" items="${list}">[
						'<c:out value="${kvo.word}"/>',
						<c:out value="${kvo.count}"/>], </c:forEach> ]);
		var options = {
			title : '모임 선호 지역',
			is3D : true,
		};
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));
		chart.draw(data, options);
	}
	$(function() {
		$('.pInsertBtn').click(function() {
			let pc = $(this).attr("data-cnt");
			let n = $(this).attr("data-no");
			let h = $(this).attr("date-head");
			console.log(pc); // 이상없음
			console.log(n);

			if (pc > h) {
				alert("모집 정원 인원을 초과하였습니다. 다른 모임을 이용해주시길 바랍니다.");
				return;
			} else {
				$.ajax({
					type : 'post',
					url : '../galendar/puzzle_insert.do',
					data : {
						"p_no" : n
					},
					success : function(res) {
						if (res == "ON") {
							alert("현재 선택한 모임에 가입된 상태입니다.");
						} else {
							alert("모임 가입이 완료되었습니다.");
							location.href = "list.do";
						}
					}
				})
			}
		})
	})
</script>
<style type="text/css">
#piechart_3d {
	position: relative;
	float: right;
	width: 600px;
	height: 277px;
	top: -280px;
	border-radius: 10px;
	border: 2px solid #fdbe51;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

#puzzleform {
	width: 900px;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	border: 2px solid #fdbe51;
}
</style>
</head>
<body>
	<div>
		<div id="puzzleform">
			<div style="padding-top: 20px;"></div>
			<div class="row">
				<div class="col-sm-6" style="margin-left: 30px;">
					<strong>모임 지역 :</strong> [${pvo.p_loc }]&nbsp;${pvo.p_dloc }
				</div>
				<div class="col-sm-6" style="margin-left: -50px;">
					<strong>모임 인원 :</strong> ${puzzlecount } / ${pvo.p_head }
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-6" style="margin-left: 30px;">
					<strong>모임 비용 :</strong> ${pvo.p_cost }원
				</div>
				<div class="col-sm-6" style="margin-left: -50px;">
					<strong>모임 시간 :</strong> ${pvo.p_time }
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-12" style="margin-left: 30px;">
					<strong>모임 제목 :</strong> ${pvo.p_title }
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-10" style="margin-left: 30px;">
					<pre
						style="white-space: pre-wrap; border: none; background-color: white; float: left; overflow: auto; height: 70px; width: 700px;">${pvo.p_content }</pre>
				</div>
				<div class="col-sm-2" style="margin-left: -30px; margin-top: 30px;">
					<input type="button" class="btn btn-sm btn-primary pInsertBtn"
						value="신청하기" data-cnt="${puzzlecount }" data-no="${pvo.p_no }"
						date-head="${pvo.p_head }">
				</div>
			</div>
		</div>
		<div id="piechart_3d"></div>
	</div>
</body>
</html>