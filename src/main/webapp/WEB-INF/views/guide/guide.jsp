<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="http://localhost:8080/coinweb/css/guide.css">
<script src="js/jquery-3.3.1.min.js"></script>
   
   <script>
$(document).ready(function() {
  jQuery(".content").hide();
//content 클래스를 가진 div를 표시/숨김(토글)
  $(".heading").click(function()
  {
    $(".content").not($(this).next(".content").slideToggle(500)).slideUp();
  });
});
</script>
<title>Coinweb - 가상화폐 모의투자</title>
</head>
<body>
<jsp:include page="../header.jsp" />


		<div class="header_bak1">
				<center>
					<h1 class="main_text">이용가이드</h1>
				</center>
				</div>
		

<center>
	<div id="ch">
		<div class="layer1">
	<div class="heading">[이용가이드]-회원가입</div>
		<span class="content">
		
		
							<p>코인웹의 모의트레이딩을 이용하기 위해서는 우선, 회원가입이 필요합니다.</p>
                            <br/>
                            <p>상단 네비게이션의 회원가입 메뉴를 클릭하셔서 회원가입을 해주셔야 합니다.</p>
                            <img src="img/cow.jpg" alt="" class="guide_1_img"  width="1000" height="50">
                            <br/>
                            <p>회원가입 시 작성한 이메일에서 '가입인증 메일'을 확인하셔서 해당링크로 접속하셔야 합니다.</p>
                            <br/>
                            <br/>
                            <p>이제 회원가입을 마무리 하였습니다. 코인웹의 회원이 되어주셔서 감사합니다.!</p>

			
			</span>
	<div class="heading">[이용가이드]-거래하기1</div>
		<span class="content">	
		
		
		<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
			<p style="color: #F08235;">- 코인웹은 빗썸 거래소의 실시간
				데이터를 이용하여 모의 트레이딩을 진행합니다.</p>
			<br /> <br />
			<p>사용자가 원하는 모의트레이딩의 코인을 선택 할 수 있습니다. (코인은 거래소의 상장된 코인을 적용합니다.)</p>
			<img src="img/guide_3.png" alt="" class="guide_1_img" width="1000" height="80"> <br />
			<p>선택한 코인의 현재 상황(데이터)을 확인 할 수 있습니다.</p>
			<img src="img/guide_4.png" alt="" class="guide_1_img" width="1000" height="100"> <br /> <br />
			
			
			</span>
	<div class="heading">[이용가이드]-거래하기2</div>
		<span class="content">
		
		
			<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
		<p style="color: #F08235;">- 코인웹은 빗썸 거래소의 실시간
				데이터를 이용하여 모의 트레이딩을 진행합니다.</p>
		<br /> <br />
		<p>선택한 코인의 24시간 동안의 시세, 거래량 변화를 확인 할 수 있습니다.</p>
		<img src="img/guide_5.png" alt="" class="guide_2_img" > <br /> <br />
		<p>선택한 코인의 현재 호가 내역을 확인 할 수 있습니다.</p>
		<img src="img/guide_6.png" alt="" class="guide_2_img"  > <br /> <br />
		<p>원하는 가격의 매수 주문을 실행 합니다. (실제 코인을 실제 거래소 거래하는 것과 같습니다.)</p>
		<img src="img/guide_7.png" alt="" class="guide_3_img"  > <br /> <br />
		<p>원하는 가격의 매도 주문을 실행 합니다. (실제 코인을 실제 거래소 거래하는 것과 같습니다.)</p>
		<img src="img/guide_8.png" alt="" class="guide_3_img"  > <br /> <br />
			
			
		</span>
	<div class="heading">[이용가이드]-거래하기3</div>
		<span class="content">
		
				<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
		<p style="color: #F08235;">- 코인웹은 빗썸 거래소의 실시간
				데이터를 이용하여 모의 트레이딩을 진행합니다.</p>
		<br /> <br />
		<p>모의 트레이딩의 대기 주문 내역을 확인 할 수 있습니다.</p>
		<img src="img/guide_9.png" alt="" class="guide_4_img"> <br /> <br />
		<p>선택한 코인의 현재 자산현황을 요약해서 보실 수 있습니다.</p>
		<img src="img/guide_10.png" alt="" class="guide_4_img"> <br />
		<br />
		<p>모의 트레이딩의 주문 내역을 확인 할 수 있습니다.</p>
		<img src="img/guide_11.png" alt="" class="guide_1_img" width="1000"> <br />
		<br />
			
		</span>
	  <div class="heading">[이용가이드]-랭킹</div>
	<span class="content">
	
	<div id="demo-6" class="collapse">
		<p>안녕하세요 코인웹을 방문해 주셔서 감사합니다.^^</p>
		<p>랭킹게시판은 코인웹의 총 사용자들을 대상으로 진행합니다.</p>
		<p>랭킹의 기준은 모의 투자금액을 바탕으로 총 수익율을 기준으로 순위를 선정합니다.</p>
		<br />
		<p>지금 바로 Rangking 1위에 도전 해보세요!</p>
		<img src="img/guide_15.png" alt="" class="guide_1_img">	<br />
		<br />
	</span> 
	</div>
	</div>
	</center>
	

	


	<jsp:include page="../footer.jsp" />
	</body>
		
</html>
