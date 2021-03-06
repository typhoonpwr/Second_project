<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fully{
	position:absolute;
	width:100%;
	height:100%;
	margin:0px auto;
}
.formposition{
	position:absolute;
	width:30%;
	height:80%;
	top:5%;
	left:8%;
	font-size:15px;
	line-height: 30px;
	border:#fdbe51 solid 2px;
	border-radius: 15px;
} 
h2{
	position:relative;
	text-align:center;
	
}
.illust{
	position:absolute;
	width:100%;
	height:100%;
}
.makePosition{
	position:relative;
	margin:0px auto;
	
	width:280px;
	height:200px;
}
.msgcss{
color: red;
}
.makePosition input{
height:20px;
border-radius: 5px;
border:1.3px solid gray;
}
.next1{
	background: #fdbe51;
	width:100px;
	height:30px;
	border:none;
	border-radius: 5px;
}
.next2{
	background: #fdbe51;
	width:135px;
	height:30px;
	border:none;
	border-radius: 5px;
}
.next3{
	background: #fdbe51;
	width:280px;
	height:30px;
	bottom:10%;
	border:none;
	border-radius: 5px;
}
.linefix{
line-height: 30%;
}
.linefix2{
line-height:0%;
}
.submitBtn{
position:absolute;
bottom:15%;
left:0%;
background: #fdbe51;
/*  width:420px;
 height:40px;
 	border:none;
	border-radius: 5px;*/
	font-size: 18px;
	font-weight: 400; 
	
}
.backBtn{
position:absolute;
background: white;
bottom:15%;
right:0%;
 width:420px;
 height:40px;
 	border:#fdbe51 solid 2px;
	border-radius: 5px;
}

.backBtn a{
text-decoration:none;
color:black;
font-size: 18px;
	font-weight: 400;
}
.finding a{
font-size:12px;
color:gray;
text-decoration: none;
}
.finding{
position:absolute;
font-size:12px;
color:gray;
right:2%;
}
.result{
position:absolute;
bottom:8%;
left:15%;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="fully">
<div class="changearea">
	<img class="illust" alt="" src="../resources/img/sign_up_.png">
	<div class="formposition">
		<h2>???????????? ??????</h2>
		<div class="makePosition">
		<br>
			<div> ???????????? ??????????????? ???????????? ??????????????????.</div>
			<!-- <div class="msgCss">{{msg1}}</div> -->
			<input type=text id="putid" size=20 v-model="putid">
			&nbsp;&nbsp;
			<button type="button" class="next1" v-on:click="next1Btn()">??????</button>
			
			<div class="step1"v-model="step1"  v-show="step1">
			<div> ???????????? ??????????????? ????????? ??????????????????.</div>
			<!-- <div class="msgCss">{{msg1}}</div> -->
			<input type=text id="putname" size=20 v-model="putname">
			&nbsp;&nbsp;
			<button type="button" class="next1" v-on:click="next2Btn()">??????</button>
			</div>
			
			<div class="step2"v-model="step2"  v-show="step2">
			<br>
			<div>?????? ???????????? ??????????????????????</div>
			<input type=radio name="sortBy" id="byEmail" value="byEmail" v-model="sortBy" >???????????? ??????
			<br>
			<div>????????? ????????? ??????????????????.</div>
			<input type=text id="putemail" size=40 v-model="putemail">
			<br>
		
			<input type=radio name="sortBy" id="byTel" value="byTel" v-model="sortBy" >??????????????? ??????
			<br>
			<div>???????????? ????????? ??????????????????.</div>
			<input type=text id="puttel" size=40 v-model="puttel">
			<br>
			<br>
			<button class="next2" v-on:click="submitBtn()">???????????? ??????</button>&nbsp;
			<button class="next2" v-on:click="backBtn()">????????????</button>
			</div>
			<br>
			<button class="next3" v-on:click="loginBtn()" v-show="step3">?????????</button>&nbsp;
		</div>
		<br>
		<div class="result" v-show="step3">???????????? ????????? ???????????? ??????????????? "{{ db_pwd }}" ?????????.</div>
		</div>
	</div>
</div>
<script>
	new Vue({
		el:'.fully',
		data:{
			putid:'',
			putname:'',
			putemail:'',
			puttel:'',
			sortBy:'',
			step1:false,
			step2:false,
			step3:false,
			db_pwd:''
		},
		methods:{
			next1Btn:function(){
				if(this.putid==''){
					alert('???????????? ??????????????????!');
				}else{
					axios.get("http://localhost:8080/member/putId.do",{
						params:{
							id:this.putid
						}
					}).then(res=>{
						if(res.data==0){
							alert('???????????? ???????????? ????????????!')
						}else{
							this.step1=true;
						}
					})
				}
			},
			next2Btn:function(){
				this.step2=true;
			},
			
			submitBtn:function(){
				this.step3=true;
				
				if(this.sortBy=='byEmail'){
					axios.get("http://localhost:8080/member/tellPwdByEmail.do",{
						params:{
							name:this.putname,
							id:this.putid,
							email:this.putemail
						}
					}).then(res=>{
						if(res.data=="NOID"){
							alert('???????????? ???????????? ????????????!')
						}else{
							this.db_pwd=res.data
						}
					
					})
				}else{
					axios.get("http://localhost:8080/member/tellPwdByTel.do",{
						params:{
							name:this.putname,
							id:this.putid,
							tel:this.puttel
						}
					}).then(res=>{
						if(res.data=="NOID"){
							alert('???????????? ???????????? ????????????!')
						}else{
							this.db_pwd=res.data
						}
					})
				}
			},
			loginBtn:function(){
				location.href="../member/log_in_move.do"
			}

		}
	})
</script>
</body>
</html>