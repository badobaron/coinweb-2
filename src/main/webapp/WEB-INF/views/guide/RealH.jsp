<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta charset="utf-8">
<title>드롭다운 네비게이션 만들기</title>
<style>

/* 메뉴 전체영역에 대한 스타일 */
#nav {
	list-style-type: none; /* 불릿 기호 없앰 */
	height: 45px;
	padding: 6px 7px;
	margin: 0;
	background: rgb(240, 130, 53);
	border-radius: 1.5em; /* 모서리 둥글게 */
}

/* 서브메뉴 영역에 대한 스타일 */
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

/* 서브메뉴 링크 스타일 */
#nav ul a {
	font-weight: normal;
	text-shadow: 0 1px 0 #FFFFFF;
	color: #333333;
}

/* 서브메뉴 각 항목의 스타일 */
#nav ul li {
	float: none;
	margin: 0;
	padding: 0;
}

/* 서브메뉴 각 항목 위로 마우스를 올렸을 때 */
#nav ul li:hover a {
	background: #0078FF;
	color: #FFFFFF;
	text-shadow: 0 1px RGBA(0, 0, 0, 0.1);
	border-radius: 0;
}

/* 서브메뉴 첫번째 항목의 스타일 */
#nav ul li:first-child>a {
	-webkit-border-top-left-radius: 8px;
	-moz-border-radius-topleft: 8px;
	-webkit-border-top-right-radius: 8px;
	-moz-border-radius-topright: 8px;
}

/* 서브메뉴 마지막 항목의 스타일 */
#nav ul li:last-child>a {
	-webkit-border-bottom-left-radius: 8px;
	-moz-border-radius-bottomleft: 8px;
	-webkit-border-bottom-right-radius: 8px;
	-moz-border-radius-bottomright: 8px;
}

/* 메뉴 각 항목에 대한 스타일 */
#nav li {
	float: right; /* li 각 항목을 왼쪽정렬시키기 */
	position: relative; /* 순서대로 표시 */
	margin: 5px 10px;
	padding: 0;
}

/* 메뉴의 링크에 대한 스타일 */
#nav li a {
	display: block; /* 영역을 만듦 */
	font-family: "굴림";
	font-weight: 600;
	font-size: 1em;
	padding: 10px 20px;
	color: #E7E5E5;
	text-decoration: none;
	margin: 0;
	border-radius: 1.4em;
	text-shadow: 0 1px 1px RGBA(0, 0, 0, 0.3); /* 그림자 효과 */
}

/* 메인 메뉴 위로 마우스 포인터를 가져갔을 때 서브 메뉴 스타일 */
#nav li:hover ul {
	opacity: 1;
}

/* 메뉴 항목 위로 마우스를 올렸을 때 스타일 */
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
	<li><a href="#">처음으로</a></li>

	</li>
	<li><a href="#">고객지원▼</a>
		<ul>
			<li><a href="http://172.16.146.123:8080/wh/guide/FAQ.jsp">FAQ</a></li>
			<li><a href="http://172.16.146.123:8080/wh/guide/guide_2.jsp">이용가이드</a></li>
			<li><a href="http://172.16.146.123:8080/wh/bbs.jsp">문의하기</a></li>
		</ul>
	<li><a href="#">안내</a></li>

<body>


	</body>
</html>
