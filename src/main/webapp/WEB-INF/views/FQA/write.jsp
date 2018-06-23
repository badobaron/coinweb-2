<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Coinweb - 가상화폐 모의투자</title>

<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/bbs.css">
<script type="http://localhost:8080/wh/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	//회원가입 유효성 체크
	$("#btn3").click(function(){
			
		if($("#bbsTitle").val() == ""){
			alert("제목을입력하세요");
			$("#bbsTitle").focus();
			return false;
		}else if($("#userID").val() == ""){
			alert("작성자이름을입력하세요");
			$("#userID").focus();
			return false;
		}
		//서버전송
		writeform.submit();
		
	});
});
	</script>

</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<div class="usermanual_up">

		<h1 class="usermanual_down">문의글 작성</h1>
	</div>

	<div id="box11">
	<form name="writeform" method="post" action="writeAction.do">
		<div class="bbsboard_table1">
				<div class="form-group1">
					<input type="text" class="form_control" id="form_control"
						placeholder="제목을 입력하세요" name="bbsTitle" id="bbsTitle">
				</div>
				<input type="hidden" name="userID" id="userID" value="${sid}">

				<textarea name="bbsContent" id="bbsContent"></textarea>
		</div>
		<div style="text-align: center;">
			<button type="button" class="btn3" id="btn3">글쓰기</button>
			<button type="reset" class="btn3" id="btn3">취소</button>
			<button type="reset" class="btn3" id="btn3">이전페이지</button>
		</div>
		</form>
	</div>
	<script>
			CKEDITOR.replace( 'bbsContent' );
	</script>
	<jsp:include page="../footer.jsp" />

</body>
</html>