
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="coinweb.dao.bbsDAO"%>
<%@page import="coinweb.vo.bbsVO"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Coinweb - 가상화폐 모의투자</title>
<!-- 페이징 처리 코드 시작 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/bbs.css">
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<!-- 페이징처리 -->
<script src="http://localhost:8080/coinweb/js/am-pagination.js"></script>
<script>
$(document).ready(function($) {
	
	var pager = $('#ampaginationsm').pagination({
		
	    maxSize: 7,	    		// max page size
	    totals: '${dbCount}',	// total pages	
	    page: '${rpage}',		// initial page		
	    pageSize: 10,			// max number items per page
	
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
		});
	
	$('#ampaginationsm').on('am.pagination.change',function(e){
		   $('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "/coinweb/bbs.do?rpage="+e.page);         
   		});
	
	$("#boxbtn").click(function($){
		var sid = '<c:out value="${sid}"/>';

		if(sid==""){
			alert("로그인 후 이용하실수 있습니다.");
		}else{
			location.href= '/coinweb/write.do';			
		}
	});
});
	
</script>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/am-pagination.css">

<link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/freeboard.css">



</head>
<body>
	<jsp:include page="../header.jsp" />

<div class="usermanual_up" >
	<h1 class="usermanual_down">문의하기</h1></div>

	<div id="boxbtn1">
		<button type="button" id="boxbtn">1:1 문의하기</button>
	</div>

	<div class="bbsboard_table">
		<table class="table123  table-hover freeboard_list_table " id="tt">
			<thead>
				<tr id="fontsize">
					<th>NO</th>
					<th id="title1">제목</th>
					<th id="date123">작성일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="vo">
				<tr id="bbs-list" class="bbs-list ">
					<td class="bbsrno">${vo.bbsID}</td>
					<td class="bbstitle" id="bbstitle">
					<a href="view.do?bbsID=${vo.bbsID}">${vo.bbsTitle}</a>
					</td>
					<td class="bbsdate">${vo.fdate}</td>
				</tr>
			</c:forEach>
		</table>

		<div id="btn2">
				<div id="ampaginationsm"></div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>