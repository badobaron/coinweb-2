<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
.reply-write-main{
border: 1px solid rgb(216, 216, 216); 
padding: 5px;
margin-top: 5px;
}
.replyDiv{
border-top: 1px solid rgb(216, 216, 216);
margin-top: 20px;
padding-top: 20px;
}

.replyBtnDiv{
float:right;
display: inline;

}
.replyBtn{
background: none;
border: 1px solid rgb(216, 216, 216);  
width: 60px;
height: 25px;
}
.replyRdate{
color: rgb(216, 216, 216); 
font-size: 13px; 
}
.fa-thumbs-o-up{
position: absolute;
right: 100px;
bottom: 5px;
}
.fa-thumbs-o-down{
position: absolute;
right: 40px;
bottom: 5px;
}
.replyTool{
position: relative;
}

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include> 
		
			<div class="commtitle">
				 <h2>Free Board</h2>
			</div>
		
		<div class="container">	 
		
			<table class="table table-bordered table-striped">
					<tr>
						<th>��ȣ</th>						
						<td>${rno}</td>
						<th>����</th>
						<td>${vo.title}</td>
						<th>��ϳ�¥</th>
						<td>${vo.bdate}</td>
						<th>��ȸ��</th>
						<td>${vo.hits}</td>
						<th>��õ</th>
						<td class="likeittd">${vo.likeit}</td>										
					</tr>
					<tr>
						<th colspan="10">
						${vo.content}
						</th>
					</table>
					
					<div style="text-align: center;">
						<button class="likeitBtn btn-like" type="button">���ƿ�</button>
						<button class="dislikeitBtn btn-dislike" type="button">�Ⱦ��</button>
					</div>
					<div style="text-align: center;">
							<a href="/coinweb/freeboard.do?"><button type="button" class="btn btn-comm-con">���� ������</button></a>
							<a href="/coinweb/freeboard_update.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">�����ϱ�</button></a>
							<a href="/coinweb/freeboard_delete.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">�ٷλ���</button></a>					
							<a href="/coinweb/index.do"><button type="button" class="btn btn-comm-con">Ȩ����</button></a>									
					</div>
					<%--reply �������� id �޾ƿ��� id�� ���ϴ� ���� ������Ѿ���. ����Ÿ���̽��� id �����ϴ� ���� �������Ѵ� --%>
						<div class="reply-write-main">
							<div class="reply-header">
								
								<p>��ü ��� <span id="replyNum"></span></p>
								<span>'ID ���� ��'</span> 
							</div>			
							<div class="reply-write" style="border: 1px solid rgb(216, 216, 216); position: relative; height: 110px;">
								<div>
									<label class="reply-write-title" style="position: absolute; z-index: -10;color: #d9d9d9;">
											���۱� �� �ٸ� ����� �Ǹ��� ħ���ϰų� ���� �Ѽ��ϴ� �Խù��� �̿��� �� ���� ������ ���� ���縦 ���� �� �ֽ��ϴ�. ������ ��й�ȭ�� ������ ��� ��ȭ�� ����, Ÿ�ο��� ���谨�� �ִ� �弳 �Ǵ� Ư�� ����/����, ���� ���� �����ϴ� �ܾ���� ǥ�ð� ���ѵ˴ϴ�.
									</label>
								</div>
								<div contenteditable="true" class="reply-write-content" name="content" style="height: 50px;"></div>
		
								<div style="text-align: right;">
									<p> <span id="sizeLimit">0</span> /300</p>
									<button class="reply-write-button btn btn-comm-con" style=" position: absolute; right :3px; top :70px; background-color: MediumSeaGreen; color: white; width: 100px;">���</button>					
								</div>														
							</div>	
						</div>
						<div class="reply-content"></div>			
					<input type="hidden" name="no" value="${vo.no}">
					
		
					
		</div>	
	<jsp:include page="../footer.jsp"></jsp:include>  
</body>

<script data-for=ready>
$(function(){
	/*���ƿ� ��ư 
	 * �α��� �� Ƚ�� ���� �ɾ���Ѵ�.*/
	$(".likeitBtn").click(function(){
		$.ajax({
			url : '/coinweb/freeboard_likeit.do',
			method :'POST',	
			data : 'no=${no}',
			dataType : 'json',
			success : function(data){
				var org = data.likeit;
				alert("�������� ���ƿ並 �������ϴ�.");
 				$(".likeittd").text(org);
			}
		});	//ajax			
	}); //btn
	
	$(".dislikeitBtn").click(function(){
		$.ajax({
			url : '/coinweb/freeboard_dislikeit.do',
			method :'POST',	
			data : 'no=${no}',
			dataType : 'json',
			success : function(data){
				var org = data.likeit;
				alert("�������� �Ⱦ�並 �������ϴ�.");
 				$(".likeittd").text(org);
			}
		});	//ajax			
	}); //btn

 	//reply 
	/*���� ó������ ���̰� �ϱ�*/
	reply_total_size();
	reply_view_load();
	
	/*���۾��� �Ʒ� label ������� �������� ����*/	
	$(".reply-write-content").keyup(function(){
			
			if($(".reply-write-content").text().length>0){
				$(".reply-write-title").fadeOut(100);
				
			}if($(".reply-write-content").text().length==0){
				$(".reply-write-title").fadeIn(100);
				
			}				
		});

	/*���� 300�� ����*/		
	$(".reply-write-content").keyup(function(){	

		$("#sizeLimit").text($('.reply-write-content').text().length);
					
			if($(".reply-write-content").text().length>300){
				alert("���ڼ� 300�ڱ��� �Է��� �� �ֽ��ϴ�.");
				var data =$(".reply-write-content").text().substring(0,300);
				$(".reply-write-content").text(data);
				$("#sizeLimit").text($('.reply-write-content').text().length);
			}
	});
	
	/*��� ��Ϲ�ư*/
	$(".reply-write-button").click(function(){
		
		var content = $(".reply-write-content").text();
		if(content == ""){
			alert("���� ������ �Է����ּ���.");
			$(".reply-write-content").focus();
		}else{
		$.ajax({
			url : '/coinweb/reply_write_check.do',
			type :'GET',
			data : {
				'content':content,'no':'${no}'	
				},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){
					reply_total_size();
					reply_view_load();
						//��� �� ���� �Ʒ� �۾� �ٽ� ����
						$(".reply-write-content").text("");
						$(".reply-write-title").fadeIn(100);
					}
			});	
		}
		
	});	
		
	
	
});//end of ready fn
		
reply_view_load = function(){				
		$.ajax({
			url : '/coinweb/reply_list.do',
			method :'GET',	
			data : 'no=${no}',
			dataType : 'json',
			success : function(data){
				$(".replyDiv").remove();				
				for(var i=0;i<data.length;i++){
			code=	"<div class='replyDiv'>"+
					"<input id='rid"+i+"' type='hidden' name='rid' value='"+data[i].rid+"'>"+
					"<span class='replyId'>id���� ��</span>"+
					"<div class='replyContent'>"+data[i].content+"</div>"+
					"<span class='replyRdate'>"+data[i].rdate+"</span>"+
					"<div class='replyTool'>"+
					"<button id='replyBtnSub"+i+"' type='button' class='replyBtnSub replyBtn'>���</button>"+
					"<div class='replyBtnDiv'>"+
					"<i class='fa fa-thumbs-o-up'></i><button id='replyBtnLikeit"+i+"' type='button' class='replyBtnLikeit replyBtn'>"+data[i].likeit+"</button>"+	
					"<i class='fa fa-thumbs-o-down'></i><button id='replyBtnDislikeit"+i+"' type='button' class='replyBtnDislikeit replyBtn'>"+data[i].dislikeit+"</button>"+							
				    "</div></div></div>";	
				$(".reply-content").append(code);
				}
				/*����� �ֱ�*/
					reply_likeit();
					reply_dislikeit();
					
					$(".replyBtnSub").click(function(){
						var index =$(this).attr("id").slice(11);
						alert(index);
					});
					
				
			}
		});
	};
	
reply_total_size = function(){
	$.ajax({
		url : '/coinweb/reply_count.do',
		method :'GET',	
		data : 'no=${no}',
		dataType :'json',
		success : function(data){
			$("#replyNum").text(data.count);				
			}
		});	
	};
	
reply_likeit = function(){
	$(".replyBtnLikeit").click(function(){
		//index ���� ����
		var index = $(this).attr("id").slice(14);
		var rid = $("#rid"+index).val();
		alert("������������ ��õ�մϴ�");
			
	$.ajax({
		url : '/coinweb/freeboardreply_likeit.do',
		method :'GET',	
		data :{
			'bid' :'${no}','rid':rid			
			  }, 
	    dataType :'json',
	    success : function(data){
		    	var org = data.likeit;
			    $("#replyBtnLikeit"+index).text(org);
		 }
		
	});	
});
};	


reply_dislikeit = function(){
	$(".replyBtnDislikeit").click(function(){
		//index ���� ����
		var index = $(this).attr("id").slice(17);
		var rid = $("#rid"+index).val();
		alert("������������ �ݴ��մϴ�");
			
	$.ajax({
		url : '/coinweb/freeboardreply_dislikeit.do',
		method :'GET',	
		data :{
			'bid' :'${no}','rid':rid			
			  }, 
	    dataType :'json',
	    success : function(data){
		    	var org = data.dislikeit;
			    $("#replyBtnDislikeit"+index).text(org);
		 }
		
	});	
});
};





			

	
</script>


	
	




</html>