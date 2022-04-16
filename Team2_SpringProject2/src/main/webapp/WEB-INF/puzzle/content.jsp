<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-top: 20px;">
		<div class="row">
			<div style="width: 100%;height: 300px; margin-left: -10px;">
				<div >
					<div>
						<img src="${cvo.cl_poster }" style="width:430px;height: 280px;margin-top: 10px;border-radius: 10px;">
					</div>
					<div style="position: relative; margin-left:500px;margin-top:-270px;width: 1000px;height: 270px">
						<div><strong style="background-color: #86b3f5; color: white;border-radius: 10px; font-size: 40px; padding-left: 20px;padding-right: 20px;">${cvo.cl_name }</strong></div>
						<br>
						<br>
						<div style="position: relative;"><h4><b>인원 :</b> ${count } / ${cvo.cl_head } 명</h4></div>
						<div style="position: relative; margin-left: 250px; margin-top: -37px;"><h4><b>활동지역 :</b> ${cvo.cl_loc }</h4></div>
						<div style="position: relative; margin-left: 520px; margin-top: -39px;"><h4><b>카테고리 :</b> ${cvo.cl_category }</h4></div>
						<br>
						<div><h4><b>주제 :</b> ${cvo.cl_content }</h4></div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;"></div>
		<div class="row">
			<div class="col-md-5" style="height: 350px; width:750px; padding:20px; border: 2px solid #fdbe51;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);border-radius: 10px;">
				<div>
					<div>
						<h4>동아리 모임 일정</h4>
					</div>
					<div class="text-end"></div>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" width="15%" class="text-center">모임지역</th>
								<th scope="col" width="40%" class="text-center">제목</th>
								<th scope="col" width="10%" class="text-center">인원</th>
								<th scope="col" width="15%" class="text-center">모임날짜</th>
								<th scope="col" width="10%" class="text-center">시간</th>
								<th scope="col" width="10%" class="text-center">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="gvo" items="${glist }">
								<tr>
									<td class="text-center">${gvo.p_loc }</td>
									<td>${gvo.p_title }</td>
									<td class="text-center">${gvo.p_head }</td>
									<td class="text-center"><fmt:formatDate value="${gvo.p_date}" pattern="yyyy-MM-dd"/></td>
									<td class="text-center">${gvo.p_time }</td>
									<td class="text-center">
										<c:if test="${1<=grade && grade<4}">
										<a href="/puzzle/${cl}/galendar/list.do" class="btn btn-sm btn-primary">신청</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div style="width: 30px;"></div>
			<div class="col-md-5" style="height: 350px; width:750px; padding:20px; border: 2px solid #fdbe51;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);border-radius: 10px;">
				<div>
					<div>
						<h4>동아리 게시판</h4>
					</div>
					<div class="text-end" style="position:relative;top: -55px;left: -10px;">
						<c:if test="${1<=grade && grade<4}">
						<a href="/puzzle/${cl}/board/list.do" style="font-size: 30px;">+</a>
						</c:if>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col" width="10%" class="text-center">번호</th>
								<th scope="col" width="50%" class="text-center">제목</th>
								<th scope="col" width="15%" class="text-center">작성자</th>
								<th scope="col" width="15%" class="text-center">작성일</th>
								<th scope="col" width="10%" class="text-center">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bvo" items="${blist }">
								<tr>
									<td class="text-center">${bvo.b_no }</td>
									<td>${bvo.b_title }</td>
									<td class="text-center">${bvo.id }</td>
									<td class="text-center"><fmt:formatDate value="${bvo.b_regdate}" pattern="yyyy-MM-dd"/></td>
									<td class="text-center">${bvo.b_hit }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;"></div>
		<div class="row">
			<div style="width: 100%;height: 420px;padding:20px; border: 2px solid #fdbe51;box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);border-radius: 10px;">
				<div>
					<div>
						<h3>동아리 갤러리</h3>
					</div>
					<div class="text-end" style="position:relative;top: -60px;left: -30px;">
						<c:if test="${1<=grade && grade<4}">
						<a href="/puzzle/${cl}/gallery/list.do" style="font-size: 40px;">+</a>
						</c:if>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<c:forEach var="img" items="${iList }" varStatus="i">
								<c:if test="${i.index<5 }">
								<tr style="display: inline;">
									<td class="text-center">
										<img src="${img }" style="width: 270px;height: 250px;">
									</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>