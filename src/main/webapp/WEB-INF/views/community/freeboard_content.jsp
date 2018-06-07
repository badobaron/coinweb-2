<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<%-- ���� �Է� css--%>
<style type="text/css">
.reply-writeMain{
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

.reply-write{
border: 1px solid rgb(216, 216, 216);
position: relative;
height: 110px;

}
.reply-write-title{
position: absolute;
z-index: -10;
color: #9494b8;
}
.reply-write-content{
height: 50px;
z-index: 0;
}
.reply-write-contentSub{
 position: relative;
 z-index: 0;
}
.reply-write-button{
position: absolute;
right :3px;
top :70px;
background-color: MediumSeaGreen;
color: white;
}
/*rereply toggle ���� ����*/
.replyDivSub{
position : relative;
display : none;
background-color: rgb(250, 250, 250);
z-index: -15;
}
.reply-writeSub{
width: 80%;
z-index: 0;
position: relative;
padding: 10px;
}
.replyicon{
border-left: 1px solid rgb(216, 216, 216);
border-bottom: 1px solid rgb(216, 216, 216);
display: inline-block;
margin-right: 15px;
margin-left: 15px;
height: 20px;
width: 20px;
}
</style>
<script src="http://localhost:8080/coinweb/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- summernote -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">

<script src="http://localhost:8080/coinweb/js/MyAjax.js"></script>
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
						<button class="likeitBtn btn-like" type="button" onclick="likeitBtnMain()">���ƿ�</button>
						<button class="dislikeitBtn btn-dislike" type="button" onclick="dislikeitBtnMain()">�Ⱦ��</button>
					</div>
					<div style="text-align: center;">
							<a href="/coinweb/freeboard.do?"><button type="button" class="btn btn-comm-con">���� ������</button></a>
							<a href="/coinweb/freeboard_update.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">�����ϱ�</button></a>
							<a href="/coinweb/freeboard_delete.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">�ٷλ���</button></a>					
							<a href="/coinweb/index.do"><button type="button" class="btn btn-comm-con">Ȩ����</button></a>									
					</div>
					<%--reply �������� id �޾ƿ��� id�� ���ϴ� ���� ������Ѿ���. ����Ÿ���̽��� id �����ϴ� ���� �������Ѵ� --%>
					<div id="test">
						<div class="reply-writeMain">
							<div class="reply-header">		
								<p>��ü ��� <span id="replyNum"></span></p>
								<span>'ID ���� ��'</span> 
							</div>			
							<div class="reply-write">
								<div>
									<label id="reply-write-titleMain" class="reply-write-title">
											���۱� �� �ٸ� ����� �Ǹ��� ħ���ϰų� ���� �Ѽ��ϴ� �Խù��� �̿��� �� ���� ������ ���� ���縦 ���� �� �ֽ��ϴ�. ������ ��й�ȭ�� ������ ��� ��ȭ�� ����, Ÿ�ο��� ���谨�� �ִ� �弳 �Ǵ� Ư�� ����/����, ���� ���� �����ϴ� �ܾ���� ǥ�ð� ���ѵ˴ϴ�.
									</label>
								</div>
								<div contenteditable="true" id="reply-write-contentMain" class="reply-write-content" name="content"></div>
		
								<div style="text-align: right;">
									<p> <span id="sizeLimitMain">0</span> /300</p>
									<button id="reply-write-buttonMain" class="reply-write-button btn btn-comm-con" style="width: 100px;">���</button>					
								</div>														
							</div>	
						</div>
						<div class="reply-content"></div>	
						</div>		
					<input type="hidden" name="no" value="${vo.no}">
					
		
					
		</div>	
	<jsp:include page="../footer.jsp"></jsp:include>  
</body>

<script data-for=ready>
/*���ƿ� ��ư 
 * �α��� �� Ƚ�� ���� �ɾ���Ѵ�.*/
function likeitBtnMain(){
	var param ={'no' : '${no}'};
	MyAjax.excute('/coinweb/freeboard_likeit.json', param, 'POST').done(function(response){
			alert("��������\n���ƿ並 �������ϴ�.");
			$(".likeittd").text(response.likeit);		
	});
} //btn

function dislikeitBtnMain(){
	var param ={'no' : '${no}'};
	MyAjax.excute('/coinweb/freeboard_dislikeit.json', param, 'POST').done(function(response){
			alert("��������\n�Ⱦ�並 �������ϴ�.");
			$(".likeittd").text(response.likeit);		
	});			
}




$(function(){
	

 	//reply 
	/*���� ó������ ���̰� �ϱ�*/
	reply_total_size();
	reply_view_load();
	
	/*reply-re���� ����*/
	/*���۾��� �Ʒ� label ������� �������� ����*/	
	$(".reply-write-content").keyup(function(){
			var index =$(this).indexSearch();
		    
			if($("#reply-write-content"+index).text().length>0){
				$("#reply-write-title"+index).fadeOut(100);
				
			}if($("#reply-write-content"+index).text().length==0){
				$("#reply-write-title"+index).fadeIn(100);
				
			}				
		});
	/*reply-re���� ����*/
	/*���� 300�� ����*/		
	$(".reply-write-content").keyup(function(){	
		var index =$(this).indexSearch();

		$("#sizeLimit"+index).text($("#reply-write-content"+index).text().length);
					
			if($("#reply-write-content"+index).text().length>300){
				alert("���ڼ� 300�ڱ���\n�Է��� �� �ֽ��ϴ�.");
				var data =$("#reply-write-content"+index).text().substring(0,300);
				$("#reply-write-content"+index).text(data);
				$("#sizeLimit"+index).text($("#reply-write-content"+index).text().length);
			}
	});
	
	/*��� ��Ϲ�ư*/
	$(".reply-write-buttonMain").click(function(){
		alert($(this).attr("id"));
		var index =$(this).indexSearch();
		alert(index);
		
		var content = $("#reply-write-content"+index).text();
		if(content == ""){
			alert("���� ������\n�Է����ּ���.");
			$("#reply-write-content"+index).focus();
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
						$("#reply-write-content"+index).text("");
						$("#reply-write-title"+index).fadeIn(100);
					}
			});	
		}
		
	});	
		
	
	
});//end of ready fn


/* index�̱� 
 * 
 * id�� class+index�� ���� �� index ���� �� ���  
 * <div class="div" id="div3">
 * index = 3;
 */

 
(function($){
	$.fn.indexSearch = function(data){	
		return $(this).attr("id").slice($(this).attr("class").length);
	};	
})(jQuery);			

reply_view_load = function(){				
		$.ajax({
			url : '/coinweb/reply_list.do',
			method :'GET',	
			data : 'no=${no}',
			dataType : 'json',
			success : function(data){
				$(".replyDiv").remove();

				for(var i=0;i<data.length;i++){
				var code= "<div class='replyDiv'>"+
					      "<input id='rid"+i+"' value='"+data[i].rid+"' name='rid' type='hidden'>"+
					      "<span class='replyId'>id���� ��</span>"+
					      "<div class='replyContent'>"+data[i].content+"</div>"+
					      "<span class='replyRdate'>"+data[i].rdate+"</span>"+
					      "<div class='replyTool'>"+
					      "<button id='replyBtnSub"+i+"' type='button' class='replyBtnSub replyBtn'>���</button>"+
						  "<div class='replyBtnDiv'>"+
						  "<i class='fa fa-thumbs-o-up'></i><button id='replyBtnLikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnLikeit replyBtn'>"+data[i].likeit+"</button>"+	
						  "<i class='fa fa-thumbs-o-down'></i><button id='replyBtnDislikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnDislikeit replyBtn'>"+data[i].dislikeit+"</button>"+							
					      "</div>"+
						  "</div>"+
						  "</div>";
				   	
			
				$(".reply-content").append(code);
				}
				/*����� �ֱ�*/
					reply_likeit();
					reply_dislikeit();
					
					$(".replyBtnSub").click(function(){
						var index =$(this).attr("id").slice(11);
						alert(index);
						$("#replyDivSub"+index).toggle(100);
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
	

	// function likeitBtnMain(){
//	 	var param ={'no' : '${no}'};
//	 	MyAjax.excute('/coinweb/freeboard_likeit.json', param, 'POST').done(function(response){
//	 			alert("��������\n���ƿ並 �������ϴ�.");
//	 			$(".likeittd").text(response.likeit);		
//	 	});
	// } //btn

	
reply_likeit = function(){
		$(".replyBtnlikeit").click(function(){	
		var index = $(this).data("id");
		var rid = $("#rid"+index).val();
		alert("������������\n��õ�մϴ�");
		var param ={'bid' : '${no}' , 'rid' :rid };
		MyAjax.excute('/coinweb/freeboardreply_likeit.json', param, 'POST').done(function(response){
			$("#replyBtnLikeit"+index).text(response.likeit);
		});	
	});
};
	
reply_dislikeit = function(){
	$(".replyBtnDislikeit").click(function(){
		var index = $(this).data("id");
		var rid = $("#rid"+index).val();
		alert("������������\n�ݴ��մϴ�");
		var param ={'bid' : '${no}' , 'rid' :rid };
		MyAjax.excute('/coinweb/freeboardreply_dislikeit.json', param, 'POST').done(function(response){
			  $("#replyBtnDislikeit"+index).text(response.dislikeit);
		});
	});
};



	
</script>

<%
// "<div id='replyDivSub"+i+"'class='replyDivSub'>"+
// "<div class='replyicon'></div>"+  // �̰ɷ� ���� �� ����
// "<div class='reply-writeSub'>"+

//		"<div class='reply-header'>"+
//			"<span>'ID ���� ��'</span>"+
//		"</div>"+
//		"<div class='reply-write'>"+
//			"<div>"+
//				"<label id='reply-write-title"+i+"' class='reply-write-title'>"+
//					"���۱� �� �ٸ� ����� �Ǹ��� ħ���ϰų� ���� �Ѽ��ϴ� �Խù��� �̿��� �� ���� ������ ���� ���縦 ���� �� �ֽ��ϴ�. ������ ��й�ȭ�� ������ ��� ��ȭ�� ����, Ÿ�ο��� ���谨�� �ִ� �弳 �Ǵ� Ư�� ����/����, ���� ���� �����ϴ� �ܾ���� ǥ�ð� ���ѵ˴ϴ�."+
//				"</label>"+
//			"</div>"+
//			"<div id='reply-write-content"+i+"' contenteditable='true' class='reply-write-content' name='contentSub'></div>"+
//				"<div class='replyWriteTool' style='text-align: right;'>"+
//				"<p> <span id='sizeLimit"+i+"'>0</span> /300</p>"+
//			"<button id='reply-write-button"+i+"'class='reply-write-buttonSub reply-write-button btn btn-comm-con' style='width: 100px;'>���</button>"+
//		"</div>"+
//	"</div>"+
//"</div>"+
//"<div class='reply-contentSub'></div>"+
//"</div>";

%>
	




</html>