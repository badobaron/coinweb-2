<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="coinweb.dao.bbsDAO"%>
<%@page import="coinweb.vo.bbsVO"%>
<%
	String BbsID = request.getParameter("BbsID");
	String rno = request.getParameter("rno");

	bbsDAO dao = new bbsDAO();
	bbsVO vo = dao.getResultVO(BbsID);

	dao.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<link rel="stylesheet" href=http://172.16.146.123:8080/wh/css/bootstrap.css>
<script type="http://172.16.146.123:8080/wh/js/bootstrap.js"></script>

<style>
.container {
	margin-top: 300px;
	
}

.form_control {
	width: 1200px;
}

.table-striped  .form_control2 {
	width: 100%;
}

.form_control2 {
	height: 300px;
}

.btn3 {
	display: block;
	width: 100px;
	background-color: #eeeeee;
	border-radius: 1.5em
}
</style>

</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<center>
		<div class="container">
			<form name="updateform" method="post"
				action="updateAction.do<%-- ?BbsID=<%=BbsID%> --%>">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								수정양식</th>

						</tr>

					</thead>
					<tbody>

						<tr>

							<td><input type="text" class="form_control"
								placeholder="글제목" name="bbsTitle" maxlength="400" id="bbsTitle"
								value="<%=vo.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><input type="text" class="form_control"
								placeholder="작성자이름" name="userID" maxlength="400" id="userID"
								value="<%=vo.getUserID()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form_control2" placeholder="내용"
									name="bbsContent" id="bbsContent" " maxlength="2048"
									with="500px height:4000px;"><%=vo.getBbsContent()%></textarea></td>

						</tr>
					</tbody>

				</table>
				<input type="hidden" name="BbsID" value="<%= BbsID %>">
				<button type="submit" class="btn3" id="btn3">글수정</button>
				<button type="reset">취소</button>

			</form>
		</div>


	</center>

</body>
</html>