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




<center><h3>�������� ���</h3></center>
	
		<div class ="n">
		<ul>
			<li class ="bd2">
				<center><label><����></label>
				<input type="text" name="title" id="title"></center>
			</li>
			<li class ="bd3">
				<center><label><����></label></center>
				<center><textarea cols="50" rows="10" name="content"></textarea></center>
			</li>
			<li class ="bd4">
				<center><label>����÷��</label>
				<input type="file" name="fname"></center>
			</li>
			<li>
				<center><button type="submit" id="btnWrite">��ϿϷ�</button>
				<button type="reset">�ٽþ���</button>
				
				<a href="admin_notice_list.jsp"><button type="button">����Ʈ</button></a></center>
			</li></ul></div>
</body>
</html>