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
	
	<!-- ��ŷ  -->
	<section class="rangking">
		<div class="rangk_header">
			<h1 class="rangking_header_h1">
			<img src="http://localhost:8080/coinweb/images/iconmonstr-award-24-120.png" style="width: 50px; height: 50px;">
			<br>���ͷ� ��ŷ</h1>
			<p>���ͷ��� KRW�� �������� ���˴ϴ�.<br>
				<br>
				���¡�� �߰ߵ� �� �ѹ�ó�� �� �� �ֽ��ϴ�.</p></div>
		<!-- ���� -->
		<div class="rangking_main">
		<!-- 123�� -->
		<div class="rangking_1">
			<img src="http://localhost:8080/coinweb/images/rank1.png" style="width: 150px; height: 150px;">
			<h3>1��</h3>
			<c:forEach items="${list}" var="vo1" begin="0" end="0">
				<p>${vo1.name}</p>
				<p>���ڻ�: ${vo1.money}</p>
				<p>���ͷ� : ${vo1.money2}%</p>
			</c:forEach>
		</div>
		
		<div class="rangk_top2 rangking_2">
			<img src="http://localhost:8080/coinweb/images/rank2.png" style="width: 150px; height: 150px;">
			<h3>2��</h3>
			<c:forEach items="${list}" var="vo2" begin="1" end="1">
				<p>${vo2.name}</p>
				<p>���ڻ�: ${vo2.money}</p>
				<p>���ͷ� : ${vo2.money2}%</p>
			</c:forEach>
		</div>
		
		<div class="rangk_top2 rangking_3">
			<img src="http://localhost:8080/coinweb/images/rank3.png" style="width: 150px; height: 150px;">
			<h3>3��</h3>
			<c:forEach items="${list}" var="vo3" begin="2" end="2">
				<p>${vo3.name}</p>
				<p>���ڻ�: ${vo3.money}</p>
				<p>���ͷ� : ${vo3.money2}%</p>
			</c:forEach>
		</div>
		
		<!-- ������20�� -->	
			<table class="rangking_4_20">
				
			  <tr>
			    <th>����</th>
			    <th>�г���</th>
			    <th>���ڻ�</th>
			    <th>���ͷ�</th>
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
	
	
	
	
	<!-- ��ŷ�� -->
	
	
	
	 	<jsp:include page="../footer.jsp" />

</body>
</html>