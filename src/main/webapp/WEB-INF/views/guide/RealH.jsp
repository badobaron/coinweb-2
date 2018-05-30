<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta charset="utf-8">
<title>��Ӵٿ� �׺���̼� �����</title>
<style>

/* �޴� ��ü������ ���� ��Ÿ�� */
#nav {
	list-style-type: none; /* �Ҹ� ��ȣ ���� */
	height: 45px;
	padding: 6px 7px;
	margin: 0;
	background: rgb(240, 130, 53);
	border-radius: 1.5em; /* �𼭸� �ձ۰� */
}

/* ����޴� ������ ���� ��Ÿ�� */
#nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	left: 0;
	top: 45px;
	width: 150px;
	background: #DDDDDD;
	border: 1px solid #B4B4B4;
	border-radius: 8px;
	-webkit-box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
	-moz-box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
	box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
	opacity: 0;
}

/* ����޴� ��ũ ��Ÿ�� */
#nav ul a {
	font-weight: normal;
	text-shadow: 0 1px 0 #FFFFFF;
	color: #333333;
}

/* ����޴� �� �׸��� ��Ÿ�� */
#nav ul li {
	float: none;
	margin: 0;
	padding: 0;
}

/* ����޴� �� �׸� ���� ���콺�� �÷��� �� */
#nav ul li:hover a {
	background: #0078FF;
	color: #FFFFFF;
	text-shadow: 0 1px RGBA(0, 0, 0, 0.1);
	border-radius: 0;
}

/* ����޴� ù��° �׸��� ��Ÿ�� */
#nav ul li:first-child>a {
	-webkit-border-top-left-radius: 8px;
	-moz-border-radius-topleft: 8px;
	-webkit-border-top-right-radius: 8px;
	-moz-border-radius-topright: 8px;
}

/* ����޴� ������ �׸��� ��Ÿ�� */
#nav ul li:last-child>a {
	-webkit-border-bottom-left-radius: 8px;
	-moz-border-radius-bottomleft: 8px;
	-webkit-border-bottom-right-radius: 8px;
	-moz-border-radius-bottomright: 8px;
}

/* �޴� �� �׸� ���� ��Ÿ�� */
#nav li {
	float: right; /* li �� �׸��� �������Ľ�Ű�� */
	position: relative; /* ������� ǥ�� */
	margin: 5px 10px;
	padding: 0;
}

/* �޴��� ��ũ�� ���� ��Ÿ�� */
#nav li a {
	display: block; /* ������ ���� */
	font-family: "����";
	font-weight: 600;
	font-size: 1em;
	padding: 10px 20px;
	color: #E7E5E5;
	text-decoration: none;
	margin: 0;
	border-radius: 1.4em;
	text-shadow: 0 1px 1px RGBA(0, 0, 0, 0.3); /* �׸��� ȿ�� */
}

/* ���� �޴� ���� ���콺 �����͸� �������� �� ���� �޴� ��Ÿ�� */
#nav li:hover ul {
	opacity: 1;
}

/* �޴� �׸� ���� ���콺�� �÷��� �� ��Ÿ�� */
#nav li:hover a {
	background: #EBEBEB;
	color: #444444;
	text-shadow: 0 1px 1px RGBA(255, 255, 255, 1);
	border-radius: 1.4em;
	-webkit-box-shadow: 0 1px 1px RGBA(0, 0, 0, 0.2);
	-moz-box-shadow: 0 1px 1px RGBA(0, 0, 0, 0.2);
	
}


}
</style>
</head>

<ul id="nav">
	<li><a href="#">ó������</a></li>

	</li>
	<li><a href="#">��������</a>
		<ul>
			<li><a href="http://172.16.146.123:8080/wh/guide/FAQ.jsp">FAQ</a></li>
			<li><a href="http://172.16.146.123:8080/wh/guide/guide_2.jsp">�̿밡�̵�</a></li>
			<li><a href="http://172.16.146.123:8080/wh/bbs.jsp">�����ϱ�</a></li>
		</ul>
	<li><a href="#">�ȳ�</a></li>

<body>


	</body>
</html>
