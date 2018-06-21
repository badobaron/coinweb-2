<%@page import="coinweb.vo.bbsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "coinweb.dao.bbsDAO" %>
    <%@ page import ="java.io.PipedWriter" %>
    <%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 


    <jsp:useBean id="bbs" class="coinweb.vo.bbsVO" scope="page"  ></jsp:useBean>
    <jsp:setProperty property="*" name="bbs" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
		<%
		bbsDAO bbsdao = new bbsDAO();
		
		int result=bbsdao.write(bbs);
		if(result==1){
			response.sendRedirect("../bbs.jsp");
		}
	
	
		
		
		
		%>
</body>
</html>