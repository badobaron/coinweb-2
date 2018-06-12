<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO"%>


<!DOCTYPE html>
<html>
<head>
  <title>Summernote</title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
  
  <link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/freeboard.css">
</head>

<script type="text/javascript">

/*CONTENT EMPTY&RESET*/
$(document).ready(function(){
	/*modal-background 수정함. 이것 수정하면 그림 영상 첨부할때 나오는 modal 값 수정 가능 */
	$(".note-btn").click(function(){
		$(".modal-backdrop").css("z-index","0").css("background-color","#000");
		$(".note-toolbar").css("z-index","0");
		
	});
	/*reset*/
	$("#contentBtnReset").click(function(){
		$("#summernote").summernote("reset");
	});
	/*컨탠츠 버튼 클릭시*/
	$("#contentBtn").click(function(){
		
		if($("#title").val()==""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;	
		/*content 없을때*/				
		}else if($('#summernote').summernote('isEmpty')) {
			  alert('내용을 입력하세요');
			  $('#summernote').summernote('focus');
			  return false;
		/*등록 ajax*/	  
		}else {
			var htmlContent = $('#summernote').summernote('code');
			alert(htmlContent);
		/*
			$(".summernote").html(htmlContent);
			freeboard_form.submit;			
		*/
		}
			
	});		
});
</script>

<body>

	<jsp:include page="../header.jsp"></jsp:include>
	
			<div class="freeboard_header">
				<h1 class="freeboard_header_h1">게시판 글쓰기</h1></div>

	<div class="container">
		
		<form id="freeboard_form" class="freeboard_form" action="/coinweb/freeboard_write_controller.do" method="post">
			<!-- 작성자 -->
			<div class="form-group">
			
					<input type="text" class="title form-control" id="title" name="title" placeholder="제목을 입력하세요">
				
			</div>
			<div class="form-group">
			
					<input type="text" class="name form-control" id="name" name="name" hidden="true" value="${name}">
				
			</div>
	
			
			
			<textarea class="content" name="content" id="summernote"></textarea>
			
			<div style="text-align: center;">	
				<button id="contentBtn" type="submit" class="btn btn-comm-con">등록</button>
				<button id="contentBtnReset"type="reset" class="btn btn-comm-con">취소</button>
				<a href="/coinweb/freeboard.do"><button type="button" class="btn btn-comm-con">뒤로가기</button></a>
			</div>
		</form>

	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

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