<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.insertdesign{	
	margin: 0px auto;
	width: 800px;
	border: 2px solid #fdbe51;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding:20px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0;
let regex = new RegExp("(.*?)\.(jpg|png)$");
$(function(){
	$('#addBtn').click(function(){
		if(fileIndex<=3){
			$('#user-table > tbody').append(
			   '<tr id="f'+fileIndex+'">'
			  +'<td width="20%" class="text-right">File'+(fileIndex+1)+'</td>'
			  +'<td width="80%"><input type=file name="files['+fileIndex+']" size=20></td>'
			  +'</tr>'
			)
			$('input[type="file"]').on('change', function(e){
				if($("input[name='files[0]']")){
					let fileInput=$("input[name='files[0]']")[0].files[0].name;
					
					if(!fileCheck(fileInput)) {
						$("input[name='files[0]']").val("");
						return false;
					}
				}
				else if($("input[name='files[1]']")){
					let fileInput=$("input[name='files[1]']")[0].files[0].name;
					
					if(!fileCheck(fileInput)) {
						$("input[name='files[1]']").val("");
						return false;
					}
				}
				else if ($("input[name='files[2]']")){
					let fileInput=$("input[name='files[2]']")[0].files[0].name;
					
					if(!fileCheck(fileInput)) {
						$("input[name='files[2]']").val("");
						return false;
					}
				}
				else if ($("input[name='files[3]']")){
					let fileInput=$("input[name='files[3]']")[0].files[0].name;
					
					if(!fileCheck(fileInput)) {
						$("input[name='files[3]']").val("");
						return false;
					}
				}
			})
			
			fileIndex++;
		} else {
			alert("4개까지의 이미지만 추가할 수 있습니다!!");
		}
	})
	$('#removeBtn').click(function(){
		if(fileIndex>0)
		{
			$('#f'+(fileIndex-1)).remove();
			fileIndex--;
		}
	})
	
	function fileCheck(fileName) {
		if(!regex.test(fileName)){
			alert("해당 파일은 업로드가 불가능합니다. jpg,png형식만 가능합니다!");
			return false;
		}
		
		return true;
	}

	
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
				<div style="margin-top: 20px;"></div>
				<div class="insertdesign">
				<form method=post action="insert_ok.do" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<th class="text-right warning" width=15%>제목</th>
							<td width=85%>
								<input type=text name=b_title size=49 class="input-sm">
							</td>
						</tr>
						<tr>
							<th class="text-right warning" width=15%>내용</th>
							<td width=85%>
								<textarea rows="10" cols="50" name="b_content" style="resize: none;"></textarea>
							</td>
						</tr>
						<tr>
							<th class="text-right warning" width=15%>첨부파일</th>
							<td width=85%>
								<table class="table">
									<tr>
										<td class="text-right">
											<input type="button" class="btn btn-xs btn-info" value="Add" id="addBtn">
											<input type="button" class="btn btn-xs btn-info" value="Remove" id="removeBtn">
										</td>
									</tr>
								</table>
								<table class="table" id="user-table">
									<tbody>
									
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<input type=submit value="글쓰기" class="btn btn-sm btn-info"> 
								<input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>