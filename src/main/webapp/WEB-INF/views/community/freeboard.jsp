<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- jQuery, bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- 페이징처리 -->
<script src="http://localhost:8080/coinweb/js/am-pagination.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/coinweb/css/am-pagination.css">

<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/coinweb/css/freeboard.css">



</head>


<body>

	<jsp:include page="../header.jsp"></jsp:include>

	<section class="freeboard">
		<div class="freeboard_header">
			<h1 class="freeboard_header_h1">자유게시판</h1>
		</div>


		<div class="container container_comm">
			<div class="freeboard_table">
				<table class="table table-hover freeboard_list_table">
					<thead>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="vo">
						<tr class="comm-list">
							<td class="rnotd">${vo.rno}</td>
							<td class="titletd"><a
								href="/coinweb/freeboard_content.do?no=${vo.no}&rno=${vo.rno}">
									${vo.title}</a></td>
							<td class="nametd">${vo.name}</td>
							<td class="bdatetd">${vo.fbdate}</td>
							<td class="hitstd">${vo.hits}</td>
							<td class="likeittd">${vo.likeit}</td>
						</tr>
					</c:forEach>
				</table>


				<div class="form-group">
					<form action="/coinweb/freeboard_search.do?rpage=${rpage}"
						method="get">

						<div style="display: inline-block;">
							<select name="findValue" class="form-control"
								style="width: 100px; float: left;">
								<option value=title>제목</option>
								<option value=content>내용
							</select> <input name="search" type="text" class="form-control"
								style="width: 150px;">
						</div>

						<button type="submit" class="btn btn-comm-con"
							style="margin-top: 5px;">검색</button>

						<button
								type="button" class="btn-comm-con btn"  id="freeboard_write_btn" 
								style="float: right; margin-top: 5px;">글쓰기</button>
						<div id="ampaginationsm" style="text-align: center;"></div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
	$(document).ready(function($) {

		var pager = $('#ampaginationsm').pagination({

			maxSize : 7, // max page size
			totals : '${dbCount}', // total pages	
			page : '${rpage}', // initial page		
			pageSize : 10, // max number items per page

			// custom labels		
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',

			btnSize : 'sm' // 'sm'  or 'lg'		
		});

		$('#ampaginationsm').on('am.pagination.change', function(e) {
			$('.showlabelsm').text('The selected page no: ' + e.page);
			$(location).attr('href', "/coinweb/freeboard.do?rpage=" + e.page);
		});
	});
	
	$("#freeboard_write_btn").click(function($){
		var email = "${email}";

		if(email==""){
			alert("로그인 후 이용하실수 있습니다.");
		}else{
			location.href= '/coinweb/freeboard_write.do?=${email}';

			
		}
		
	});
	
	
	
	
	
</script>

</html>