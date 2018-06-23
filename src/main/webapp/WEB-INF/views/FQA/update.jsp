<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@page import="coinweb.dao.bbsDAO"%>
<%@page import="coinweb.vo.bbsVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Coinweb - 가상화폐 모의투자</title>
 <link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/bbs.css">
<script type="http://localhost:8080/wh/js/bootstrap.js"></script>

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		//회원가입 유효성 체크
		$("#btn3").click(function() {

			if ($("#bbsTitle").val() == "") {
				alert("제목을입력하세요");
				$("#bbsTitle").focus();
				return false;
			} else if ($("#userID").val() == "") {
				alert("작성자이름을입력하세요");
				$("#userID").focus();
				return false;
			} else if ($("#bbsContent").val() == "") {
				alert("내용입력은필수입니다");
				$("#bbsContent").focus();
				return false;

			}

			//서버전송
			writeform.submit();

		});
	});
</script>

 <link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/bbs.css">
<script type="http://localhost:8080/wh/js/bootstrap.js"></script>

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="usermanual_up">
		<h1 class="usermanual_down">문의글 수정</h1>
	</div>

	<div id="box11">
	<form name="updateform" method="post" action="updateAction.do">
		<div class="bbsboard_table1">
				<div class="form-group1">
					<input type="text" class="form_control" id="form_control"
						value=${ vo.bbsTitle} name="bbsTitle" id="bbsTitle">
				</div>
				<div id="tx">
					<textarea name="bbsContent" id="bbsContent">${vo.bbsContent}</textarea>
				</div>
		</div>
		<div style="text-align: center;">
			<button type="submit" class="btn3" id="btn3">수정하기</button>
			<button type="reset" class="btn3" id="btn4">취소</button>
			<button type="reset" class="btn3" id="btn5">이전페이지</button>
		</div>
	</form>
	</div>
	<script>
			CKEDITOR.replace( 'bbsContent' );
	</script>

	<jsp:include page="../footer.jsp" />

</body>
</html>