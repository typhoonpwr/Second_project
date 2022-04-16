<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<div class="container" style="width: 30%;">
    <div style="margin-top:50px;">
        <br>
        <form id="form1" method="post" action="dojoin.do">
            <h3>${sessionScope.id}님 안녕하세요!</h3>
            <br>
            운영진들에게 자신을 소개해 보세요!
           	<br>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="자기소개" name="g_msg" aria-describedby="basic-addon2">
            </div>
            <div>
            <button type="button" class="btn btn-secondary" onclick="dojoin();">가입신청</button>
            </div>
        </form>
    </div>

</div>
<script>
function dojoin(){
	if(confirm('가입신청 하시겠습니까?')){
		$("#form1").submit();
		alert('신청되었습니다.');
	}
}
</script>