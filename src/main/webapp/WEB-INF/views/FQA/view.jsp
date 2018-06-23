<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="coinweb.dao.bbsDAO"%>
<%@page import="coinweb.vo.bbsVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Coinweb - ����ȭ�� ��������</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/bbs.css">
<script type="http://localhost:8080/wh/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<div class="usermanual_up">
		<h1 class="usermanual_down">�����ϱ�</h1></div>

	<div class="allbox">
		<form method="post" action="freeboard/writeAction.jsp">
			<div id="box2">

				<div id="contitle">
					<p>${vo.bbsTitle}</p>
					<p id="c_date">${vo.fdate}</p>
				</div>
				<div id="bbscon">
					<p id="c_id">
						<font color=blue>${vo.userID}</font>
					</p>
				</div>
				<div id="c_content">
					<tr>
						<td id="bc">${vo.bbsContent}</td>
					</tr>
				</div>

			</div>

			<div style="text-align: center;">
				<a
					href="http://localhost:8080/coinweb/update.do?bbsID=${vo.bbsID}"><button
						type="button" id="btn3">�����ϱ�</button></a> <a
					href="http://localhost:8080/coinweb/bbs.do"><button
						type="button" id="btn3">�������</button></a> <a
					href="http://localhost:8080/coinweb/deleteAction.do?bbsID=${vo.bbsID }"><button
						type="button" id="btn3">�����ϱ�</button></a>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />

</body>
</html>