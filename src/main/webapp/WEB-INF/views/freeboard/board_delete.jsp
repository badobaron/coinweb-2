<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://172.16.146.123:8080/mycgv/css/mycgv.css">
</head>
<body>
	
	<jsp:include page="../header.jsp" />

	<div class="content">
		
		<section class="content-style">		
			<h1>사용자 게시판</h1>
			<form name="dform" class="board-delete" action="deleteAction.do" method="post">
				<ul>					
					<li>
						
						<h2>정말로 삭제하시겠습니까?</h2>	
					</li>
					<li>
						<input type="hidden" name="no" value="${BbsID }">
						<button type="submit" >삭제완료</button>						
						<a href="view.do?BbsID=<%=BbsID%>"><button type="button">이전페이지</button></a>
						<a href="bbs.do"><button type="button">전체리스트</button></a>
						<a href="http://172.16.146.123:8080/coinweb/bbs.do">
							<button type="button">홈으로</button></a>
					</li>
				</ul>
			</form>		
		</section>		

	</div>
	
	
</body>
</html>











