<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Coinweb - ����ȭ�� ��������</title>

<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/bbs.css">
<script type="http://localhost:8080/wh/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	//ȸ������ ��ȿ�� üũ
	$("#btn3").click(function(){
			
		if($("#bbsTitle").val() == ""){
			alert("�������Է��ϼ���");
			$("#bbsTitle").focus();
			return false;
		}else if($("#userID").val() == ""){
			alert("�ۼ����̸����Է��ϼ���");
			$("#userID").focus();
			return false;
		}
		//��������
		writeform.submit();
		
	});
});
	</script>

</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<div class="usermanual_up">

		<h1 class="usermanual_down">���Ǳ� �ۼ�</h1>
	</div>

	<div id="box11">
	<form name="writeform" method="post" action="writeAction.do">
		<div class="bbsboard_table1">
				<div class="form-group1">
					<input type="text" class="form_control" id="form_control"
						placeholder="������ �Է��ϼ���" name="bbsTitle" id="bbsTitle">
				</div>
				<input type="hidden" name="userID" id="userID" value="${sid}">

				<textarea name="bbsContent" id="bbsContent"></textarea>
		</div>
		<div style="text-align: center;">
			<button type="button" class="btn3" id="btn3">�۾���</button>
			<button type="reset" class="btn3" id="btn3">���</button>
			<button type="reset" class="btn3" id="btn3">����������</button>
		</div>
		</form>
	</div>
	<script>
			CKEDITOR.replace( 'bbsContent' );
	</script>
	<jsp:include page="../footer.jsp" />

</body>
</html>