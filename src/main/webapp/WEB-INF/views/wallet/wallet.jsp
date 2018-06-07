<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://localhost:8080/coinweb/css/coin.css">

<title>Insert title here</title>
</head>
<body class="business">

	
	<jsp:include page="../header.jsp" />


<section class="wallet" id="wallet">

<div class="wallet_tablink_btn_box">
<button class="wallet_tablink" onclick="openPage('mywallet', this, '5px solid #0080ff', '#0080ff')" id="defaultOpen">내 지갑</button>
<button class="wallet_tablink" onclick="openPage('mybusiness', this, '5px solid #0080ff', '#0080ff' )">거래내역</button>
<button class="wallet_tablink" onclick="openPage('myreturn', this, '5px solid #0080ff', '#0080ff')">수익률</button>
</div>
<div id="mywallet" class="wallet_tabcontent">
<div class="mywallet_box">
  <h1>내 지갑</h1>
  <h4>현재 총합 보유 자산</h4>
	  <div class="mywalletcoin btc">
	  <span style="color:#787878; ">BTC </span><br>
	  <span style="font-size: 22px;">10.055829774</span>
	  </div>
	  <div class="mywalletcoin krw">
	  <span style="color:#787878; ">KRW </span> <br>
	  <span  style="font-size: 22px;">10.055829774</span>
	  </div>
	  <div>
	    <h4>화폐별 지갑</h4>
	    <div>
	     <table class="coinWallet" >
	     		<tr>
	     			<th>코인</th>
	     			<th>이름</th>
	     			<th>보유량</th>
	     			<th>거래 대기중</th>
	     			<th>BTC 가치</th>
	     		</tr>
	       <tr>
	     			<td>USD</td>
	     			<td>Dollar</td>
	     			<td>5054.4864</td>
	     			<td>0.00000</td>
	     			<td>7.548435</td>
	     	
	     		<tr>
	     			<td class="coinWallet_2" colspan="5" style="text-align: center; font-size: 18px;">거래내역이 없습니다.</td>
	     		</tr>
	     </table>
	    
	    </div>
</div>     
</div>
</div>

<div id="mybusiness" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>거래내역</h1>
  <h4>대기중인 거래</h4>
     <table class="coinWallet">
     		<tr>
     			<th>코인</th>
     			<th>시간</th>
     			<th>종류</th>
     			<th>가격</th>
     			<th>거래량</th>
     			<th>상태</th>
     		</tr>
     		<tr>
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">거래내역이 없습니다.</td>
     		</tr>
     </table>

  <h4>채결된 거래</h4>
      <table class="coinWallet">
     		<tr>
     			<th>코인</th>
     			<th>시간</th>
     			<th>종류</th>
     			<th>가격</th>
     			<th>거래량</th>
     			<th>상태</th>
     		</tr>
     		<tr>
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">거래내역이 없습니다.</td>
     		</tr>
     </table>
</div>
</div>


<div id="myreturn" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>수익률</h1>
  <h4>자금 및 현재 자산</h4>
  <p>USD를 기반으로 계산됩니다. <br> 월 수익률 랭킹 1위에겐 상금이 지급됩니다.</p>
  
  	<div class="profit waller_box1">
  		<div class="profit1">초기자금</div><div class="profit2">100000</div><div class="profit2">10.207206288</div>
  	</div>	
  	<div class="profit waller_box1">	
  		<div class="profit1">이번달자산</div><div class="profit2">100000</div><div class="profit2">10.207206288</div>
  	</div>	
  	<div class="profit waller_box1">	
  		<div class="profit1">현재자산</div><div class="profit2">100000</div><div class="profit2">10.207206288</div>
  	</div>	
  	<div class="profit waller_box2">	
  		<div class="profit1">월수익률</div><div class="profit3">-0.78%</div>
  	</div>	
  	<div class="profit waller_box2">	
  		<div class="profit1">가입후 수익률</div><div class="profit3">-17.77%</div>
  	</div>

</div>  
</div>

</section>
<jsp:include page="../footer.jsp" />

<script>
function openPage(pageName,elmnt,boder,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("wallet_tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("wallet_tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.border = "";
        tablinks[i].style.color = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.borderLeft = boder;
    elmnt.style.color = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

	

</body>
</html>