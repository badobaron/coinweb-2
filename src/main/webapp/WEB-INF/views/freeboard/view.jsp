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
<link rel="stylesheet" href=http://172.16.146.123:8080/wh/css/bootstrap.css>
<script type="http://172.16.146.123:8080/wh/js/bootstrap.js"></script>
<style type="text/css"></style>
<style>

.container {

	margin-top :250px;
	
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
.td1{
background-color: #eeeeee; text-align: center;
}
.td2 {background-color: #ffffff; text-align: center;}
.td3{border:  1px solid none;background-color: #eeeeee;}
.btn5{display: line-block; border-radius: 1.5em; /* 모서리 둥글게 */
list-style: none; background-color:rgb(2,113,179);
color: white; width: 200px; margin-top: 15px;margin-bottom: 15px;}
#usermanualtitle {
	background-color: #7C7C7C;
	margin-top: 100px;
	margin-bottom: 100px;
	overflow: hidden;
	width: 100%;
	height: 150px;
}

.usermanual_text {
	
}

</style>

</head>

<body>
	<%
		/* 		String userID = null;
				if(session.getAttribute("userID") != null){
					userID = (String)session.getAttribute("userID");
		 		}
			  int BbsID = 0;
			  if(request.getParameter("userID")!=null){
				  bbsID = Integer.parseInt(request.getParameter("BbsID"));
			  }
			   */
	%>
	<jsp:include page="../header.jsp"></jsp:include>
	
	
	<section id="usermanualtitle" style="margin-top: 0px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<center>
					<h2 class="usermanual_text">글쓰기</h2>
				</center>
			</div>
		</div>
	</div>
</section>
	<center>
		<div class="container">
			<form method="post" action="freeboard/writeAction.jsp">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>

							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">게시판보기</th>

						</tr>
					</thead>
					<tbody>
						<tr>

							<td class="td1">번호</td>
							<td class="td1"><%=rno%></td>
						</tr>
						<tr>
							<th class="td2">제목</th>
							<td class="td2"><%=vo.getBbsTitle()%></td>

						</tr>
						<tr>
							<th class="td1">작성자</th>
							<td class="td1"><%=vo.getUserID()%></td>
						<tr>
							<th>작성일</th>
							<td><%=vo.getBbsdate()%></td>
						</tr>
						<tr>
							<th colspan="8" width="450px"class="td3">내용</th>
						</tr>
						<tr>
							<td colspan="8"class="td4" height="450px;"><%=vo.getBbsContent()%></td>
						</tr>
					
					</tbody>
					
				</table>
				<a href="http://172.16.146.123:8080/coinweb/update.do?BbsID=<%=BbsID%>&rno=<%=rno%>"><button type="button" class="btn5" >수정하기</button></a>
                <a href="http://172.16.146.123:8080/coinweb/bbs.do"><button type="button" class="btn5" >목록으로</button></a>
                <a href="http://172.16.146.123:8080/coinweb/deleteAction.do?BbsID=<%= BbsID %>"><button type="button" class="btn5" >삭제하게</button></a>
			</form>
			
		</div>


	</center>

</body>
</html>