<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include> 
	
	
		<div class="commtitle">
			 <h2>Freeboard</h2>
		</div>
		<div class="container container_comm">	  
		  <table class="table table-bordered table-striped comm-table">	
		  	    <tr>
		     		<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>좋아요</th>
		        </tr>
		       <c:forEach items="${list}" var="vo">
		  		<tr class="comm-list">
			  		<td class="rnotd">${vo.rno}</td>
			  		<td class="titletd"> 
			  		<a href="/coinweb/freeboard_content.do?no=${vo.no}&rno=${vo.rno}">
			  		${vo.title}</a>
			  		</td>	
			  		<td class="nametd">${vo.name}</td>
			  		<td class="bdatetd">${vo.bdate}</td>
			  		<td class="hitstd">${vo.hits}</td>
			  		<td class="likeittd">${vo.likeit}</td>	  		
		  		</tr>	  		
		  		</c:forEach>
			</table>
				<div id="ampaginationsm" style="text-align: center"></div>
				 <div class="form-group">
				 <form action="/coinweb/freeboard_search.do?rpage=${rpage}" method="get">
					<select name="findValue" class="form-control input-sm">
						<option value=title>제목</option>
						<option value=content>내용</select>
					<input name="search" type="text" class="form-control form-group-search">
					
					<button  type="submit" class="btn btn-comm-con" style="margin-top: 5px;">검색</button>
					
					<a href="/coinweb/freeboard_write.do"><button type="button" class= "btn-comm-con btn" style="float: right; margin-top: 5px;">글쓰기</button></a>
				</form>
				</div>
		</div>

	<jsp:include page="../footer.jsp"></jsp:include>  
</body>

<script>
jQuery.noConflict();
	jQuery(document).ready(function($) {
		
		var pager = $('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: 5,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
			});
		
		$('#ampaginationsm').on('am.pagination.change',function(e){
			   $('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "/coinweb/freeboard.do?rpage="+e.page);         
	   		});
		});	
</script>

</html>