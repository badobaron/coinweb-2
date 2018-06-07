
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="coinweb.dao.bbsDAO"%>
<%@page import="coinweb.vo.bbsVO"%>
<%@page import="java.util.ArrayList"%>

<%-- <%
	bbsDAO dao = new bbsDAO();
	ArrayList<bbsVO> list = dao.getResultList();
	dao.close();
%> --%>
<%
/* --����¡ */
	String rpage = request.getParameter("page");
   bbsDAO dao = new bbsDAO();


	//����¡ ó�� - startCount, endCount ���ϱ�
	int startCount = 0;
	int endCount = 0;
	int pageSize = 5;	//���������� �Խù� ��
	int reqPage = 1;	//��û������	
	int pageCount = 1;	//��ü ������ ��
	int dbCount = dao.execTotalCount();	//DB���� ������ ��ü ���
	
	//�� ������ �� ���
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	}else{
		pageCount = dbCount/pageSize+1;
	}

	//��û ������ ���
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = (reqPage-1) * pageSize+1; 
		endCount = reqPage *pageSize;
	}else{
		startCount = 1;
		endCount = 3;
		
		
	}


	//NoticeDAO dao = new NoticeDAO();
	ArrayList<bbsVO> list = dao.getResultList(startCount, endCount);
	dao.close();
	/* --����¡ */
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>
<!-- ����¡ ó�� �ڵ� ���� -->
<link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/am-pagination.css">
<script src="http://localhost:8080/coinweb/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:8080/coinweb/js/paging.js"></script>

<!-- ����¡ ó�� �ڵ� ���� -->

<!-- <link rel="stylesheet" type="text/css" href="http://localhost:8080/wh/js/am-pagination.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/paging.js"></script>
 -->


<style>
a,a:hover {
	color: black;
	text-decoration: none;
}

.container {
	padding-top: 150px;
	padding-bottom: 100px;
	margin: auto;
}

.table-striped {
	width: 50%;
}

.bt2 {
	display: line-block;
	background-color: pink;
	border-radius: 1.5em;
	list-style: none;
	color: white;
	width: 200px;
	height: 100px;
	font-size: 20px;
	margin-top: 200px;
}

.mainth { "
	background-color: #ffffff;
	text-align: center;
}

th {
	border-bottom: solid 1px black;
}

td {
	border-bottom: solid 1px #eeeeee;
	width: 100px;
}

.div2 {
	
}

#usermanualtitle {
	background-color: #7C7C7C;
	margin-top: 100px;
	margin-bottom: 100px;
	overflow: hidden;
	width: 100%;
	height: 150px;
}

.usermanual_text {
	color: white;
}
</style>

<script>
	$(document).ready(function(){
		var pager = $('#ampaginationsm').pagination({

		    maxSize: 7,	    		// max page size
		    totals: '<%=dbCount%>',	// total pages	
		    page: '<%=rpage%>',		// initial page		
		    pageSize: 5,			// max number items per page
	
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
		    
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		$('#ampaginationsm').on('am.pagination.change',function(e){
			  		
	            $(location).attr('href', "http://localhost:8080/coinweb/bbs.do?rpage="+e.page);       
	    });
		
 	});
</script> 

</head>
<body>
 
<!-- ����¡ ó�� �ڵ� ���� -->
<jsp:include page="header.jsp"/>
	
	<section id="usermanualtitle" style="margin-top: 0px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<center>
					<h2 class="usermanual_text">���ǻ���</h2>
				</center>
			</div>
		</div>
	</div>
</section>


	<center>
		<a href="http://localhost:8080/coinweb/write.do"><button type="button" class="bt2">1��1�����ϱ�</button></a>
		<div class="container">

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<div class="div2">
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
					</tr>
					</div>
				</thead>
				<tbody>
					<!-- 		<tr>
						<th style="background-color: #ffffff; text-align: center;">1</th>
						<th style="background-color: #ffffff; text-align: center;">�̰Ծȵǿ�</th>
						<th style="background-color: #ffffff; t text-align: center;">�ۼ���</th>
						<th style="background-color: #ffffff; t text-align: center;">2018-04-12</th>
					</tr>
 -->


						<%
							for (bbsVO vo : list) {
						%>
					
					<tr>
						<td class="td5"><%=vo.getBbsID()%></td>
						<td><a
							href="view.do?BbsID=<%=vo.getBbsID()%>&rno=<%=vo.getRno()%>"><%=vo.getBbsTitle()%></a>
							<!-- </a> --></td>
						<td><%=vo.getUserID()%></td>
						<td><%=vo.getBbsdate()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
				<tfoot>	
				<tr>
					<td colspan="4">
						<div id="ampaginationsm"></div>	
					</td>
					
				</tr>
			</tfoot>
				
			</table>	
			</div>
	</center>
	<jsp:include page="footer.jsp" />
</body>
</html>