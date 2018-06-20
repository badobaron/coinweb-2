<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="http://localhost:8080/coinweb/css/guide.css">
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
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div id="header_bak1">
		<center>
			<h1 id="main_text">FAQ</h1>
		</center>
	</div>


	<center>
		<div id="ch">
			<div class="layer1">
				<div id="heading1" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 모의트레이딩 시 어떤
					데이터를 보고하나요?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>국내 거래소 빗썸의 실제 데이터를 실시간으로 적용하고 있습니다. 각 코인의 가격, 호가, 주문량을 보시면서
						트레이딩 할 수 있습니다.</p>


				</span>
				<div id="heading2" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 원하는 거래소에서
					모의 트레이딩 하는 건가요?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>빗썸 거래소에 모의트레이딩을 할 수 있습니다.</p>


				</span>
				<div id="heading3" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 어떤 코인을 가지고
					모의트레이딩을 할 수 있나요?
				</div>
				<span class="content">

					<p style="margin-bottom: 20px;">
						<span style="color: red; font-weight: bold;">Answer</span>
					</p>
					<p>빗썸 거래소에 상장된 코인을 이용해 모의 트레이딩 하실 수 있습니다.</p>


				</span>
				<div id="heading4" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 실제 거래소에서
					트레이딩 하는 방식과 똑같나요?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>네, 각 거래소에서 실제 트레이딩 하는 방식과 같습니다. 실제 트레이딩이라 생각하시고 실전처럼 모의트레이딩을
						하실길 권장해드립니다.</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 모의트레이딩한
					거래내역을 확인 할 수 있나요??
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>
						네, 상단 네비게이션의
						<자산현황> 카테고리에서 코인별 모의트레이딩 하신 거래내역( 매수/매도 )을 확인 할 수 있습니다. 
					</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span>랭킹의 순위 기준은
					무엇인가요?

				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>랭킹에서 순위의 기준은 '수익률'로 하고 있습니다. 초기 투자비용 대비 수익률이 가장 높은 회원이 1위에
						랭크됩니다.</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 모의트레이딩한 초기
					모의트레이딩 투자금은 어떻게 되나요?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>최초 회원가입 후 30,000,000(삼천만)원의 투자금을 지급하고 있습니다. 해당 투자금으로 실제
						트레이딩이라는 생각으로 실전에 들어가기 전 트레이닝을 하시면 됩니다.</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 코인웹을 이용하면서
					문의 및 건의사항을 전달 하고싶은데 어떻게 하나요?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>
						상단 네비게이션 메뉴에서
						<고객센터> -> <문의하기>를 선택하셔서 하고싶은 내용을 전달해 주시면 됩니다. 
					</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> 랭킹은 반영의 기준은
					언제인가요?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>실시간으로 반영됩니다.</p>
				</span>
			</div>
		</div>
	</center>



	<jsp:include page="../footer.jsp" />
</body>
</html>

