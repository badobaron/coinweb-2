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
<title>Coinweb - 가상화폐 모의투자</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bbs.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<div class="usermanual_up">
		<h1 class="usermanual_down">문의하기</h1></div>

	<div class="allbox">
			<div id="box2">

				<div id="contitle">
					<p>${vo.bbsTitle}</p>
					<p id="c_date">${vo.fdate}</p>
				</div>
				<div id="c_id">
					<p>${vo.email}</p>
				</div>
				<div id="c_content">
					<tr>
						<td id="bc">${vo.bbsContent}</td>
					</tr>
				</div>

			</div>

			<div style="text-align: center;">
				<a href="${pageContext.request.contextPath}/bbs.do"><button
						type="button" class="btn3">목록으로</button></a> <a
					href="${pageContext.request.contextPath}/update.do?bbsID=${vo.bbsID}"><button
						type="button" class="btn3">수정하기</button></a> <a
				href="${pageContext.request.contextPath}/deleteAction.do?bbsID=${vo.bbsID }">
				<button type="button" class="btn3">삭제하기</button>
				</a>
			</div>
	</div>
	<jsp:include page="../footer.jsp" />

</body>
</html>