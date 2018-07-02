<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/guide.css">
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
			<h1 class="main_text">FAQ</h1>
		</center>
	</div>


	<center>
		<div id="ch">
			<div class="layer1">
				<div class="heading">Q.모의트레이딩 시 어떤 데이터를 보고하나요?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>국내 거래소 빗썸의 실제 데이터를 실시간으로 적용하고 있습니다.</p>
					<p>거래소의 코인의 가격, 호가, 주문량을 보시면서 트레이딩 할 수 있습니다.</p>


				</span>
				<div class="heading">Q. 원하는 거래소에서 모의 트레이딩이 가능한가요?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>

					<p>빗썸 거래소의 코인들만 모의트레이딩을 할 수 있습니다.</p>
				</span>

				<div class="heading">Q. 어떤 코인을 가지고 모의트레이딩을 할 수 있나요?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>비트코인, 비트코인 캐쉬, 이더리움, 이더 클래식, 리플, 대시, 라이트코인,모네로, 제트캐시, 퀀텀</p>
					<p>총 10개의 코인을 가지고 모의 트레이딩 하실 수 있습니다.</p>
				</span>


				<div class="heading">Q. 실제 거래소에서 트레이딩 하는 방식과 똑같나요?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>네, 거래소에서 실제 트레이딩 하는 방식과 같습니다.</p>
					<p>실제 트레이딩이라 생각하시고 실전처럼 모의트레이딩을 하실길 권장해드립니다.</p>
				</span>


				<div class="heading">Q. 모의 트레이딩한 결과는 어디서 확인 하나요?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>[거래하기] 화면에서 각 거래소별, 코인별 현재 보유한 코인의 자산 현황을 확인 할 수 있습니다.</p>
					<p>또한, 상단 네비게이션의 [자산현황] 카테고리에서 거래소별 자산을 비롯한 총 자산현황을 한눈에 확인 하실 수
						있습니다.</p>

				</span>

				<div class="heading">Q. 랭킹의 순위 기준은 무엇인가요?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>랭킹에서 순위의 기준은 '수익률'로 하고 있습니다. 초기 투자비용 대비 수익률이 가장 높은 회원이 1위에
						랭크됩니다.</p>

				</span>

				<div class="heading">Q. 초기 모의트레이딩 투자금은 어떻게 되나요?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>최초 회원가입 후 30,000,000(삼천만)원의 투자금을 지급하고 있습니다.</p>
					<p>해당 투자금으로 실제 트레이딩이라는 생각으로 실전에 들어가기 전 트레이닝을 하시면 됩니다.</p>

				</span>

				<div class="heading">Q. 코인웹을 이용하면서 문의 및 건의사항을 전달 하고싶은데 어떻게 하나요?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>상단 네비게이션 메뉴에서 [문의게시판]을 선택하셔서 하고싶은 내용을 전달해 주시면 됩니다.</p>
					<p>답변은 메일을 통해 보내드립니다.</p>
					<p>* 문의하기 게시판은 본인의 게시물만 보입니다.</p>

				</span>



			</div>
		</div>
	</center>

	<jsp:include page="../footer.jsp" />
</body>
</html>
