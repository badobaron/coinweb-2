<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
    <%@page import="coinweb.dao.bbsDAO"%>
<%@page import="coinweb.vo.bbsVO"%>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="vo" class="coinweb.vo.bbsVO" />
<jsp:setProperty name="vo" property="*" />

<%
String BbsID = request.getParameter("BbsID");
	bbsDAO dao = new bbsDAO();
	int result = dao.getDeleteResult(BbsID);
	dao.close();
	
	if(result == 1){
		response.sendRedirect("../bbs.jsp");
	}

%>