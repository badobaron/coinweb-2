<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style >

body div.content section.content-style form.board li label  {
	display:inline-block;
	background-color:Tomato;
	width:100px;
	padding:8px 4px 8px 30px;
	font-size:10pt;
	font-weight:bold;
	color:white;
	border-radius:5px;
}
.la0{
margin-bottom: -2000px;
}

}
</style>
<script src="http://localhost:8080/mycgv/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#btnWrite").click(function(){
			if($("#title").val() == ""){
				alert("제목을 입력해주세요");
				$("#title").focus();
				return false;
			}
			//서버전송
			boardForm.submit();
		});
		
	});

</script>
</head>
<body>
	


	<div class="content">
		
		<section class="content-style">		
			<h1>사용자 게시판</h1>
			<form name="boardForm" action="board_controller.jsp" method="post" class="board">
				<ul>
					<li>
						<center><label class="la0">제목</label>
						<input type="text" name="title" id="title">
					</li></center>
					<li>
						<center><label class="la1">내용</label>
						<textarea rows="12" cols="60" class="w1"></textarea>
					</li></center>
					<li>
						<label>첨부파일</label>
						<input type="file" name="fname">
					</li>
					<li>
						<button type="button" id="btnWrite">완료</button>
						<button type="reset">취소</button>
					</li>
				</ul>
			</form>			
		</section>	
	</div>
	

</body>
</html>






