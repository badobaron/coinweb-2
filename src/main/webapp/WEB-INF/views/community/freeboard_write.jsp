<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="utf-8" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO"%>


<!DOCTYPE html>
<html>

<body>

	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="commtitle">
		<h2>Free Board Write</h2>
	</div>

	<div class="container">
	
		<form id="freeboard_form" class="freeboard_form" action="/coinweb/freeboard_write_controller.do" method="post">
			<div style="text-align: left;">
			<input class="title" id="title" name="title" type="text" placeholder="제목을 입력하세요" style="width: 500px">
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

</body>
<script>
/*summernote form*/
var jq = jQuery.noConflict();

	jq(document).ready(function(){
		jq('#summernote').summernote({
		 height: 500,                 // set editor height
		 minHeight: null,            // set minimum height of editor
		 maxHeight: null,            // set maximum height of editor
	     focus: true,
	     placeholder: '내용을 입력하세요',	  
		});		
	});	
		
		
		
  		
		
	
	/*CONTENT EMPTY&RESET*/
	jq(document).ready(function(){
		/*modal-background 수정함. 이것 수정하면 그림 영상 첨부할때 나오는 modal 값 수정 가능 */
		jq(".note-btn").click(function(){
			jq(".modal-backdrop").css("z-index","-1").css("background-color","#000").css("button","0");
		});
		/*reset*/
		jq("#contentBtnReset").click(function(){
			jq("#summernote").summernote("reset");
		});
		/*컨탠츠 버튼 클릭시*/
		jq("#contentBtn").click(function(){
			
			if(jq("#title").val()==""){
				alert("제목을 입력하세요");
				jq("#title").focus();
				return false;	
			/*content 없을때*/				
			}else if(jq('#summernote').summernote('isEmpty')) {
				  alert('내용을 입력하세요');
				  jq('#summernote').summernote('focus');
				  return false;
			/*등록 ajax*/	  
			}else {
				var htmlContent = jq('#summernote').summernote('code');
				alert(htmlContent);
			/*
				jq(".summernote").html(htmlContent);
				freeboard_form.submit;			
			*/
			}
				
		});		
	});
</script>



</html>