<<<<<<< HEAD
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
//content Ŭ������ ���� div�� ǥ��/����(���)
  $(".heading").click(function()
  {
    $(".content").not($(this).next(".content").slideToggle(500)).slideUp();
  });
});
</script>
<title>Insert title here</title>
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
				<div class="heading">Q.����Ʈ���̵� �� � �����͸� �����ϳ���?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>���� �ŷ��� ������ ���� �����͸� �ǽð����� �����ϰ� �ֽ��ϴ�.</p>
					<p>�ŷ����� ������ ����, ȣ��, �ֹ����� ���ø鼭 Ʈ���̵� �� �� �ֽ��ϴ�.</p>


				</span>
				<div class="heading">Q. ���ϴ� �ŷ��ҿ��� ���� Ʈ���̵��� �����Ѱ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>

					<p>���� �ŷ����� ���ε鸸 ����Ʈ���̵��� �� �� �ֽ��ϴ�.</p>
				</span>

				<div class="heading">Q. � ������ ������ ����Ʈ���̵��� �� �� �ֳ���?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>��Ʈ����, ��Ʈ���� ĳ��, �̴�����, �̴� Ŭ����, ����, ���, ����Ʈ����,��׷�, ��Ʈĳ��, ����</p>
					<p>�� 10���� ������ ������ ���� Ʈ���̵� �Ͻ� �� �ֽ��ϴ�.</p>
				</span>


				<div class="heading">Q. ���� �ŷ��ҿ��� Ʈ���̵� �ϴ� ��İ� �Ȱ�����?</div>
				<span class="content">
					<p style="color: #F08235">Answer</p>
					<p>��, �ŷ��ҿ��� ���� Ʈ���̵� �ϴ� ��İ� �����ϴ�.</p>
					<p>���� Ʈ���̵��̶� �����Ͻð� ����ó�� ����Ʈ���̵��� �ϽǱ� �����ص帳�ϴ�.</p>
				</span>


				<div class="heading">Q. ���� Ʈ���̵��� ����� ��� Ȯ�� �ϳ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>[�ŷ��ϱ�] ȭ�鿡�� �� �ŷ��Һ�, ���κ� ���� ������ ������ �ڻ� ��Ȳ�� Ȯ�� �� �� �ֽ��ϴ�.</p>
					<p>����, ��� �׺���̼��� [�ڻ���Ȳ] ī�װ����� �ŷ��Һ� �ڻ��� ����� �� �ڻ���Ȳ�� �Ѵ��� Ȯ�� �Ͻ� ��
						�ֽ��ϴ�.</p>

				</span>

				<div class="heading">Q. ��ŷ�� ���� ������ �����ΰ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>��ŷ���� ������ ������ '���ͷ�'�� �ϰ� �ֽ��ϴ�. �ʱ� ���ں�� ��� ���ͷ��� ���� ���� ȸ���� 1����
						��ũ�˴ϴ�.</p>

				</span>

				<div class="heading">Q. �ʱ� ����Ʈ���̵� ���ڱ��� ��� �ǳ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>���� ȸ������ �� 30,000,000(��õ��)���� ���ڱ��� �����ϰ� �ֽ��ϴ�.</p>
					<p>�ش� ���ڱ����� ���� Ʈ���̵��̶�� �������� ������ ���� �� Ʈ���̴��� �Ͻø� �˴ϴ�.</p>

				</span>

				<div class="heading">Q. �������� �̿��ϸ鼭 ���� �� ���ǻ����� ���� �ϰ������ ��� �ϳ���?</div>
				<span class="content">

					<p style="color: #F08235">Answer</p>
					<p>��� �׺���̼� �޴����� [���ǰԽ���]�� �����ϼż� �ϰ���� ������ ������ �ֽø� �˴ϴ�.</p>

				</span>



			</div>
		</div>
	</center>

	<jsp:include page="../footer.jsp" />
</body>
</html>
=======
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
//content Ŭ������ ���� div�� ǥ��/����(���)
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
					<span style="color: blue; font-weight: bold;">Q.</span> ����Ʈ���̵� �� �
					�����͸� �����ϳ���?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>���� �ŷ��� ������ ���� �����͸� �ǽð����� �����ϰ� �ֽ��ϴ�. �� ������ ����, ȣ��, �ֹ����� ���ø鼭
						Ʈ���̵� �� �� �ֽ��ϴ�.</p>


				</span>
				<div id="heading2" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> ���ϴ� �ŷ��ҿ���
					���� Ʈ���̵� �ϴ� �ǰ���?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>���� �ŷ��ҿ� ����Ʈ���̵��� �� �� �ֽ��ϴ�.</p>


				</span>
				<div id="heading3" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> � ������ ������
					����Ʈ���̵��� �� �� �ֳ���?
				</div>
				<span class="content">

					<p style="margin-bottom: 20px;">
						<span style="color: red; font-weight: bold;">Answer</span>
					</p>
					<p>���� �ŷ��ҿ� ����� ������ �̿��� ���� Ʈ���̵� �Ͻ� �� �ֽ��ϴ�.</p>


				</span>
				<div id="heading4" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> ���� �ŷ��ҿ���
					Ʈ���̵� �ϴ� ��İ� �Ȱ�����?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>��, �� �ŷ��ҿ��� ���� Ʈ���̵� �ϴ� ��İ� �����ϴ�. ���� Ʈ���̵��̶� �����Ͻð� ����ó�� ����Ʈ���̵���
						�ϽǱ� �����ص帳�ϴ�.</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> ����Ʈ���̵���
					�ŷ������� Ȯ�� �� �� �ֳ���??
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>
						��, ��� �׺���̼���
						<�ڻ���Ȳ> ī�װ����� ���κ� ����Ʈ���̵� �Ͻ� �ŷ�����( �ż�/�ŵ� )�� Ȯ�� �� �� �ֽ��ϴ�. 
					</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span>��ŷ�� ���� ������
					�����ΰ���?

				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>��ŷ���� ������ ������ '���ͷ�'�� �ϰ� �ֽ��ϴ�. �ʱ� ���ں�� ��� ���ͷ��� ���� ���� ȸ���� 1����
						��ũ�˴ϴ�.</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> ����Ʈ���̵��� �ʱ�
					����Ʈ���̵� ���ڱ��� ��� �ǳ���?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>���� ȸ������ �� 30,000,000(��õ��)���� ���ڱ��� �����ϰ� �ֽ��ϴ�. �ش� ���ڱ����� ����
						Ʈ���̵��̶�� �������� ������ ���� �� Ʈ���̴��� �Ͻø� �˴ϴ�.</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> �������� �̿��ϸ鼭
					���� �� ���ǻ����� ���� �ϰ������ ��� �ϳ���?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>
						��� �׺���̼� �޴�����
						<������> -> <�����ϱ�>�� �����ϼż� �ϰ���� ������ ������ �ֽø� �˴ϴ�. 
					</p>
				</span>

				<div id="heading5" class="heading">
					<span style="color: blue; font-weight: bold;">Q.</span> ��ŷ�� �ݿ��� ������
					�����ΰ���?
				</div>
				<span class="content"> <span
					style="color: red; font-weight: bold;">Answer</span>

					<p>�ǽð����� �ݿ��˴ϴ�.</p>
				</span>
			</div>
		</div>
	</center>



	<jsp:include page="../footer.jsp" />
</body>
</html>

>>>>>>> 69deb3fd160cc6def254bf74e6b2cfd8c828939b
