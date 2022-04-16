<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-top: 20px;">
    <br>
    <table class="table">
        <thead>
        <tr style="text-align:center;">
            <th class="col-1">번호</th>
            <th class="col-5">제목</th>
            <th class="col-2">글쓴이</th>
            <th class="col-1">날짜</th>
            <th class="col-1">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${list}">
        <tr style="text-align:center;">
            <th scope="row">${b.b_no }</th>
            <td><a href="detail.do?id=${b.b_no}" style="text-decoration: none;color:black;">${b.b_title}</a>&nbsp;<span style="color:red;"><c:if test="${b.replycnt>0}">[${b.replycnt}]</c:if></span></td>
            <td>${b.id}</td>
            <td><fmt:formatDate value="${b.b_regdate}" pattern="yyyy-MM-dd"/></td>
            <td>${b.b_hit}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:set var="page" value="${empty param.p?1:param.p}"/>
    <c:set var="startNum" value="${page-(page-1)%5}"/>
    <c:set var="totalpage" value="${fn:substringBefore(Math.ceil(total/10),'.')}"/>
    <c:set var="endNum" value="${startNum+4<=totalpage?startNum+4:totalpage}"/>
    <h6 style="float: right;">&nbsp;&nbsp;${page} /${totalpage} pages</h6>
    <h6 style="float: right;"> 총 ${total} 게시물</h6>
    <a href="write.do"><button type="button" class="btn btn-secondary">글쓰기</button></a>
    
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
        <c:if test="${startNum==1}">
            <li class="page-item disabled">
             <a class="page-link">Previous</a>
            </li>
        </c:if>
        <c:if test="${startNum!=1}">
            <li class="page-item">
            <a class="page-link" href="list.do?p=${startNum-1}&q=${q}&t=${t}">Previous</a>
            </li>
        </c:if>
            <c:forEach var="i" begin="0" end="4">
            <c:if test="${(startNum+i)<=totalpage}">
            <c:if test="${startNum+i==page}">
            <li class="page-item active"><a class="page-link" href="list.do?p=${startNum+i}&q=${q}&t=${t}">${startNum+i}</a></li>
            </c:if>
            <c:if test="${startNum+i!=page}">
            <li class="page-item"><a class="page-link" href="list.do?p=${startNum+i}&q=${q}&t=${t}">${startNum+i}</a></li>
            </c:if>
            </c:if>
            </c:forEach>
            <c:if test="${endNum!=totalpage}">
            <li class="page-item">
                <a class="page-link" href="list.do?p=${endNum+1}&q=${q}&t=${t}">Next</a>
            </li>
            </c:if>
            <c:if test="${endNum==totalpage}">
            <li class="page-item disabled">
                <a class="page-link" href="#">Next</a>
            </li>
            </c:if>
        </ul>
    </nav>
    <form action="list.do" method="get">
	<div style="float: right;">
	 <select name="q" class="form-select" aria-label="Default select example" style="font-size:15px;width:130px;display:inline;">
  		<option value="b_title">제목</option>
  		<option value="id">아이디</option>
	</select>
    	<input type="text" name="t" style="height:33px;">
    	<button type="submit" class="btn btn-secondary">검색</button>
	</div>
    </form>
</main>