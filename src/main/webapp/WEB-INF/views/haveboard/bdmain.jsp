<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style >
li{list-style-type: none;
}


</style>
</head>
<body>
<jsp:include page="../guide/RealH.jsp"></jsp:include>




<center><h3>공지사항 등록</h3></center>
	
		<div class ="n">
		<ul>
			<li class ="bd2">
				<center><label><제목></label>
				<input type="text" name="title" id="title"></center>
			</li>
			<li class ="bd3">
				<center><label><내용></label></center>
				<center><textarea cols="50" rows="10" name="content"></textarea></center>
			</li>
			<li class ="bd4">
				<center><label>파일첨부</label>
				<input type="file" name="fname"></center>
			</li>
			<li>
				<center><button type="submit" id="btnWrite">등록완료</button>
				<button type="reset">다시쓰기</button>
				
				<a href="admin_notice_list.jsp"><button type="button">리스트</button></a></center>
			</li></ul></div>
</body>
</html>