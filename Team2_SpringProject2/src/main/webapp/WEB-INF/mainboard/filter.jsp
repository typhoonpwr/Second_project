<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.entire2{
width:100%;
height:1200px;
}
.banner{
background-color: #fdbe51;
width:100%;
height:236px;
top:50px;
text-align: center;
}
.listblock{
border: 2px solid #63bc8d;
border-radius: 10px;
width:1000px;
height:800px;
position:absolute;
top:370px;
left:400px;
padding:20px;
}
.topper{
background-color:#63bc8d;
position:absolute;
top:-1px;
left:-1px;
width:1000px;
height:50px;
border-radius: 10px 10px 0px 0px;
}
table{
position:absolute;
top:0px;
}
th{
color:white;
font-size: 20px;
}
tr{
height:48px;
border-bottom: 1px solid #63bc8d;
}
.admin a{
color:#f57243;
font-weight: 900px;
text-decoration: none;
}
.Nadmin a{
color:black;
text-decoration: none;
}
.check{
position:absolute;
bottom:-250px;
left:800px;
}
.pagingBtn{
width:80px;
height:30px;
border:none;
border-radius:5px;
background-color: #63bc8d;
color:white;
}
.pagingBtn a{
font-size:15px;
font-weight:700px;
color:white;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="entire2">
<div class="banner">
	<img class="bannerimg" alt="" src="../resources/img/banner.png">
</div>
<div class="listblock">
	<div class="topper"></div>
	<table>
		<tr>
		<th width="550px">제목</th>
		<th width="150px">글쓴이</th>
		<th width="150px">날짜</th>
		<th width="100px">조회수</th>
		</tr>
		<br>
	<c:forEach var="voA" items="${listA }">	
	 <tr>
		<td class="admin" width="550px"><a href="../mainboard/detail.do?b_no=${voA.b_no }">${voA.b_title}</a></td> 
		<td class="admin" width="150px">admin</td> 
		<td class="admin" width="150px">${today}</td> 
		<td class="admin" width="100px">${voA.b_hit}</td> 
	</tr> 
	</c:forEach>
	<c:forEach var="vo" items="${list }">	
	 <tr>
		<td class="Nadmin" width="550px"><a href="../mainboard/detail.do?b_no=${vo.b_no }">${vo.b_title}</a></td> 
		<td class="Nadmin" width="150px">${vo.id}</td> 
		<td class="Nadmin" width="150px">${today}</td> 
		<td class="Nadmin" width="100px">${vo.b_hit}</td> 
	</tr> 
	</c:forEach>
	</table>

</div>
<div class="check">
 <c:if test="${curpage>1 }">
 <button class="pagingBtn"><a href="../mainboard/myBoard_go.do?page=${curpage-1}">이전</a></button>
 </c:if>
 &nbsp;&nbsp;${curpage} page / ${totalpage} pages &nbsp;&nbsp;
 <c:if test="${curpage<totalpage }">
 <button class="pagingBtn"><a href="../mainboard/myBoard_go.do?page=${curpage+1}">다음</a></button>
 </c:if>
</div>
</div>
<script>
new Vue({
	el:'.entire2',
	data:{
		curpage:${curpage },
		totalpage:${totalpage }
	},

	methods:{
	
		prev:function(){
			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
		},
		next:function(){
			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
		}
	}
})
</script> 
</body>
</html>