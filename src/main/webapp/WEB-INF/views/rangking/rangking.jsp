<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.dao.*, coinweb.vo.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="http://localhost:8080/coinweb/css/coin.css">
<script src="js/jquery-3.3.1.min.js"></script>


<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../header.jsp" />
	
	<!-- 랭킹  -->
	<section class="rangking">
		<div class="rangk_header">
			<h1 class="rangking_header_h1">
			<img src="http://localhost:8080/coinweb/images/iconmonstr-award-24-120.png" style="width: 50px; height: 50px;">
			<br>수익률 랭킹</h1>
			<p>수익률은 KRW를 기준으로 계산됩니다.<br>
				<br>
				어뷰징이 발견될 시 롤백처리 될 수 있습니다.</p></div>
		<!-- 순위 -->
		<div class="rangking_main">
		<!-- 123위 -->
		<div class="rangking_1">
			<img src="http://localhost:8080/coinweb/images/rank1.png" style="width: 150px; height: 150px;">
			<h3>1위</h3>
			<c:forEach items="${list}" var="vo1" begin="0" end="0">
				<p>${vo1.name}</p>
				<p>총자산: ${vo1.money}</p>
				<p>수익률 : ${vo1.money2}%</p>
			</c:forEach>
		</div>
		
		<div class="rangk_top2 rangking_2">
			<img src="http://localhost:8080/coinweb/images/rank2.png" style="width: 150px; height: 150px;">
			<h3>2위</h3>
			<c:forEach items="${list}" var="vo2" begin="1" end="1">
				<p>${vo2.name}</p>
				<p>총자산: ${vo2.money}</p>
				<p>수익률 : ${vo2.money2}%</p>
			</c:forEach>
		</div>
		
		<div class="rangk_top2 rangking_3">
			<img src="http://localhost:8080/coinweb/images/rank3.png" style="width: 150px; height: 150px;">
			<h3>3위</h3>
			<c:forEach items="${list}" var="vo3" begin="2" end="2">
				<p>${vo3.name}</p>
				<p>총자산: ${vo3.money}</p>
				<p>수익률 : ${vo3.money2}%</p>
			</c:forEach>
		</div>
		
		<!-- 나머지20위 -->	
			<table class="rangking_4_20">
				
			  <tr>
			    <th>순위</th>
			    <th>닉네임</th>
			    <th>총자산</th>
			    <th>수익률</th>
			  </tr>
			   
			  <c:forEach items="${list}" var="vo" begin="3" end="21">
			  <tr>
			    <td>${vo.rno}</td>
			    <td>${vo.name}</td>
			    <td> ${vo.money}</td>
			    <td>${vo.money2}%</td>
			  </tr>
			  </c:forEach>
			
	
			
			
			
			</table>
			
		
		
		</div> 
	
	
	</section>
	
	
	
	
	<!-- 랭킹끝 -->
	
	
	
	 	<jsp:include page="../footer.jsp" />

</body>
</html>