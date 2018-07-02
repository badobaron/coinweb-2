<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Coinweb - 가상화폐 모의투자</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bbs.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<script>
$(document).ready(function(){
	
	
	$("#write").click(function(){
			
		if($("#bbsTitle").val() == ""){
			alert("제목을 입력하세요");
			$("#bbsTitle").focus();
			return false;
		}else if($('#summernote').summernote('isEmpty')) {
			  alert('내용을 입력하세요');
			  $('#summernote').summernote('focus');
			  return false;
		}
		writeform.submit();
		
	});
	
	$("#reset").click(function(){
		$("#summernote").summernote("reset");
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
	<form name="writeform" method="post" action="${pageContext.request.contextPath}/writeAction.do">
		<div class="bbsboard_table1">
				<div class="form-group1">
					<input type="text" class="form_control" id="form_control"
						placeholder="제목을 입력하세요" name="bbsTitle" id="bbsTitle">
				</div>
				<input type="hidden" name="userID" id="userID" value="${sid}">
				<input type="hidden" name="email" id="email" value="${email}">

				<textarea class="content" name="bbsContent" id="summernote"></textarea>
		</div>
		<div style="text-align: center;">
			<button type="button" class="btn3" id="write">글쓰기</button>
			<button type="reset" class="btn3" id="reset">취소</button>
			<a href="${pageContext.request.contextPath}/bbs.do"><button type="button" class="btn3" id="btn5">이전페이지</button></a>
		</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
	
	<script>
/*summernote form*/


		$('#summernote').summernote({
		 height: 500,                 // set editor height
		 minHeight: 500,            // set minimum height of editor
		 maxHeight: 800,            // set maximum height of editor
	     focus: true,
	     placeholder: '내용을 입력하세요.',	  
		});		

</script>

</body>
</html>