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
<button class="wallet_tablink" onclick="openPage('mywallet', this, '5px solid #0080ff', '#0080ff')" id="defaultOpen">�� ����</button>
<button class="wallet_tablink" onclick="openPage('mybusiness', this, '5px solid #0080ff', '#0080ff' )">�ŷ�����</button>
<button class="wallet_tablink" onclick="openPage('myreturn', this, '5px solid #0080ff', '#0080ff')">���ͷ�</button>
</div>
<div id="mywallet" class="wallet_tabcontent">
<div class="mywallet_box">
  <h1>�� ����</h1>
  <h4>���� ���� ���� �ڻ�</h4>
	  <div class="mywalletcoin btc">
	  <span style="color:#787878; ">BTC </span><br>
	  <span style="font-size: 22px;">10.055829774</span>
	  </div>
	  <div class="mywalletcoin krw">
	  <span style="color:#787878; ">KRW </span> <br>
	  <span  style="font-size: 22px;">10.055829774</span>
	  </div>
	  <div>
	    <h4>ȭ�� ����</h4>
	    <div>
	     <table class="coinWallet" >
	     		<tr>
	     			<th>����</th>
	     			<th>�̸�</th>
	     			<th>������</th>
	     			<th>�ŷ� �����</th>
	     			<th>BTC ��ġ</th>
	     		</tr>
	       <tr>
	     			<td>USD</td>
	     			<td>Dollar</td>
	     			<td>5054.4864</td>
	     			<td>0.00000</td>
	     			<td>7.548435</td>
	     	
	     		<tr>
	     			<td class="coinWallet_2" colspan="5" style="text-align: center; font-size: 18px;">�ŷ������� �����ϴ�.</td>
	     		</tr>
	     </table>
	    
	    </div>
</div>     
</div>
</div>

<div id="mybusiness" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>�ŷ�����</h1>
  <h4>������� �ŷ�</h4>
     <table class="coinWallet">
     		<tr>
     			<th>����</th>
     			<th>�ð�</th>
     			<th>����</th>
     			<th>����</th>
     			<th>�ŷ���</th>
     			<th>����</th>
     		</tr>
     		<tr>
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">�ŷ������� �����ϴ�.</td>
     		</tr>
     </table>

  <h4>ä��� �ŷ�</h4>
      <table class="coinWallet">
     		<tr>
     			<th>����</th>
     			<th>�ð�</th>
     			<th>����</th>
     			<th>����</th>
     			<th>�ŷ���</th>
     			<th>����</th>
     		</tr>
     		<tr>
     			<td class="coinWallet_2" colspan="6" colspan="5" style="text-align: center; font-size: 18px;">�ŷ������� �����ϴ�.</td>
     		</tr>
     </table>
</div>
</div>


<div id="myreturn" class="wallet_tabcontent">
<div class="mywallet_box">
   <h1>���ͷ�</h1>
  <h4>�ڱ� �� ���� �ڻ�</h4>
  <p>USD�� ������� ���˴ϴ�. <br> �� ���ͷ� ��ŷ 1������ ����� ���޵˴ϴ�.</p>
  
  	<div class="profit waller_box1">
  		<div class="profit1">�ʱ��ڱ�</div><div class="profit2">100000</div><div class="profit2">10.207206288</div>
  	</div>	
  	<div class="profit waller_box1">	
  		<div class="profit1">�̹����ڻ�</div><div class="profit2">100000</div><div class="profit2">10.207206288</div>
  	</div>	
  	<div class="profit waller_box1">	
  		<div class="profit1">�����ڻ�</div><div class="profit2">100000</div><div class="profit2">10.207206288</div>
  	</div>	
  	<div class="profit waller_box2">	
  		<div class="profit1">�����ͷ�</div><div class="profit3">-0.78%</div>
  	</div>	
  	<div class="profit waller_box2">	
  		<div class="profit1">������ ���ͷ�</div><div class="profit3">-17.77%</div>
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