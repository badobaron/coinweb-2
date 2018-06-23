<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://localhost:8080/coinweb/css/coin.css">
<title>Coinweb - 가상화폐 모의투자</title>
<script src="http://localhost:8080/coinweb/js/jquery-3.3.1.min.js"></script>
<script>
var sid = ${sid};
function numberWithCommas(x) {
    return Math.round(x).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function Floor(n, pos) {
	var digits = Math.pow(10, pos);
	var num = Math.floor(n * digits) / digits;
	return num.toFixed(pos);
}
function fShowData() {
	try {
		GetWalletList();
		GetOrderList();
		GetHistoryList();
	} catch(e){			
    } finally {
        setTimeout("fShowData()", 3000);
    }
}
function GetWalletList(){
	if(sid!=0){
		$.ajax({
			url : 'http://localhost:8080/coinweb/wallet_list.do',
			type :'GET',	
			data : 'id='+sid,
			dataType : 'json',
			success : function(data){
					$("#krw").html(numberWithCommas(data[0].available)+"원");
					$("#total").html(numberWithCommas(data[0].tot)+"원");
					$("#tot").html(numberWithCommas(data[0].tot)+"원");
					if(data[0].tot == 30000000)
						$("#profit").html("0.00%");	
					else if(data[0].tot > 30000000)
						$("#profit").html("+"+Floor((data[0].tot/30000000)*100-100,2)+"%").css("color","#43A047");
					else if(data[0].tot < 30000000)
						$("#profit").html(Floor((data[0].tot/30000000)*100-100,2)+"%");
					$('#wallet_table > tbody').empty();
					for(var i=0;i<data.length;i++){
						if(data[i].available>0){
							code = "<tr><td>"+data[i].coin+"</td><td>"+data[i].coin_name+"</td><td>"+Floor(data[i].available,4)+"</td><td>"+Floor(data[i].using,4);
							$('#wallet_table > tbody:last').append(code);
						}
					}
				}	
			});
	}
}		

function GetOrderList(){
	$.ajax({
		url : 'http://localhost:8080/coinweb/order_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin=ALL',
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#order_wait").hide();
			else if(data.length == 0) $("#order_wait").show();
			$('#order_table > tbody').empty();
			for(var i=0;i<data.length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td style='color:red;'>매수</td>"; else type = "<td style='color:blue;'>매도</td>";
				code = "<tr><td>"+data[i].coin+"</td><td>"+data[i].date+"</td>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
				+Floor(data[i].amount,4)+"/"+Floor(data[i].amount_c,4)+"</td><td>대기중</td></tr>";
				$('#order_table > tbody:last').append(code);
			}
		}
	});
}

function GetHistoryList(){
	$.ajax({
		url : 'http://localhost:8080/coinweb/history_list.do',
		type :'GET',	
		data : 'id='+sid+'&coin=ALL',
		dataType : 'json',
		success : function(data){
			if(data.length != 0) $("#history_wait").hide();
			else if(data.length == 0) $("#history_wait").show();
			$('#history_table > tbody').empty();
			var length = 0;
			if(data.length < 100) length = data.length; else length = 100;
			for(var i=0;i<length;i++){
				var type = data[i].type;
				if(type == 'B')	type = "<td style='color:red;'>매수</td>"; else type = "<td style='color:blue;'>매도</td>";
				code = "<tr><td>"+data[i].coin+"</td><td>"+data[i].date+"</td>"+type+"<td>"+numberWithCommas(data[i].price)+"</td><td>"
					+Floor(data[i].amount,4)+"</td><td>완료</td></tr>";
				$('#history_table > tbody:last').append(code);
			}
		}
	});
}
</script>
</head>
<body class="business" onload="fShowData()">

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
	  <span style="color:#787878; ">총 자산 </span><br>
	  <span style="font-size: 22px;" id="total"></span>
	  </div>
	  <div class="mywalletcoin krw">
	  <span style="color:#787878; ">KRW </span> <br>
	  <span  style="font-size: 22px;" id="krw"></span>
	  </div>
	  <div>
	    <h4>화폐별 지갑</h4>
	    <div>
	     <table class="coinWallet" id="wallet_table">
	     	<thead>
	     		<tr>
	     			<th>코인</th>
	     			<th>이름</th>
	     			<th>보유량</th>
	     			<th>거래 대기중</th>
	     		</tr>
	     	</thead>
	     	<tbody>
	     	</tbody>
	     </table>
	    
	    </div>
</div>     
</div>
</div>

<div id="mybusiness" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>거래내역</h1>
  <h4>대기중인 거래</h4>
     <table class="coinWallet"  id="order_table">
     	<thead>
     		<tr>
     			<th>코인</th>
     			<th>시간</th>
     			<th>종류</th>
     			<th>가격</th>
     			<th>거래량</th>
     			<th>상태</th>
     		</tr>
     		<tr id="order_wait">
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">대기주문 내역이 없습니다.</td>
     		</tr>
     	</thead>
     	<tbody>
     	</tbody>
     </table>

  <h4>채결된 거래</h4>
      <table class="coinWallet"  id="history_table">
      	<thead>
     		<tr>
     			<th>코인</th>
     			<th>시간</th>
     			<th>종류</th>
     			<th>가격</th>
     			<th>거래량</th>
     			<th>상태</th>
     		</tr>
     		<tr id="history_wait">
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">거래내역이 없습니다.</td>
     		</tr>
     	</thead>
     	<tbody>
     	</tbody>
     </table>
</div>
</div>


<div id="myreturn" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>수익률</h1>
  <h4>자금 및 현재 자산</h4>
  <p>KRW를 기반으로 계산됩니다.</p>
  
  	<div class="profit waller_box1">
  		<div class="profit1">초기자금</div><div class="profit2">30,000,000원</div>
  	</div>	
  	<div class="profit waller_box1">	
  		<div class="profit1">현재자산</div><div class="profit2" id="tot"></div>
  	</div>	
  	<div class="profit waller_box2">	
  		<div class="profit1">가입후 수익률</div><div class="profit3" id="profit"></div>
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