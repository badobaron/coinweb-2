<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<body>
<jsp:include page="../header.jsp"></jsp:include> 
		
	<div class="commtitle">
		 <h2>Free Board Write</h2>
	</div>	
	<div class="container">	 
		
		<form name="boardForm" action ="freeboard_update_controller.do" method="post" class="board_update">
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="content" id="content">
			<table class="table table-bordered table-striped">
					<tr>
						<th>��ȣ</th>						
						<td>${rno}</td>
						<th>����</th>
						<td><input type="text" id="title" name="title" value="${vo.title}" style="width: 400px; border: none;"></td>
						<th>��ϳ�¥</th>
						<td>${vo.bdate}</td>
						<th>��ȸ��</th>
						<td>${vo.hits}</td>		
						<th>���ƿ�</th>
						<td>${vo.likeit}</td>										
					</tr>
					<tr>
						<th colspan="10">
						<div id="summernote"></div>
						</th>
					</table>
					<div style="text-align: center;">
						<a href="/coinweb/freeboard_content.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con" >���� ������</button></a>
						<button type="submit" id="btnUpdate" class="btn btn-comm-con">�����ϱ�</button>
						<a href="/coinweb/freeboard_delete.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">�����ϱ�</button></a>
						<a href="/coinweb/index.do"><button type="button" class="btn btn-comm-con">Ȩ����</button></a>
					</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>  
</body>

<script>
var jq = jQuery.noConflict();

	jq(document).ready(function(){
		/*setter*/
		jq('#summernote').summernote('code','${vo.content}');
			/*modal z-index*/
		jq(".note-btn").click(function(){
			jq(".modal-backdrop").css("z-index","-1").css("background-color","#000").css("button","0");
		});

	});
	</script>


<script type="text/javascript">
var jq = jQuery.noConflict();
jq(document).ready(function(){
	
	jq("#btnUpdate").click(function(){
		
		if(jq("#title").val() == ""){
			alert("������ �Է��ϼ���");
			jq("#title").focus();
			return false;
		}else if(jq('#summernote').summernote('isEmpty')){
			alert("������ �Է��ϼ���");
			jq('#summernote').summernote('focus');
			return false;
		}else{
			/*������ �޾Ƽ� submit ���� content�� �ֱ�*/
			var htmlContent = jq('#summernote').summernote('code');
			jq("#content").val(htmlContent);
		}
		
			//��������
			boardForm.submit();	
	});
		
}); //f
</script>




</html>