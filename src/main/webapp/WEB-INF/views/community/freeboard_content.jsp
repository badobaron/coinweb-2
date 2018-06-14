<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>

<!-- jQuery, bootstrap -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://localhost:8080/coinweb/css/freeboard.css">
<!-- 리플 -->
<script src="http://localhost:8080/coinweb/js/MyAjax.js"></script>

<script>

	$(function(){
		
		//토글기능
		var check_value = $("#reply-content-check").val(); 
		
		if(check_value == "hide"){				
			$(".reply-content").css("display","inline-block");			
			$("#reply-content-check").val("show");
		}else{
			$(".reply-content").css("display","none");
			$("#reply-content-check").val("hide");
		}			
		
		var no = "${vo.no}";
		
		$.ajax({
			url : 'http://localhost:8080/coinweb/reply_list.do',
			method :'GET',	
			data : 'no='+no,
			dataType : 'json',
			success : function(data){
				$(".view1, .view2, .view3").remove();				
				for(i=0;i<data.length;i++){
					code = 	"<span class='view1'>"+data[i].rid+"</span>"
							+ "<span class='view2'>"+data[i].rdate+"</span>"
							+ "<div class='view3'>"+data[i].content+"</div>";					
					
					$(".reply-content").append(code);
				}
			}
		});
	});

	$(document).ready(function(){			
		
		//댓글작성 버튼
		$("#btnReWrite").click(function(){
			var check_value = $("#reply-write-check").val();
			
			if(check_value == "hide"){
				$(".reply-write").css("display","block");
				$("#reply-write-check").val("show");
			}else{
				$(".reply-write").css("display","none");
				$("#reply-write-check").val("hide");
				$(".reply-write-content").text("");
			}			
		});
		
		
		//댓글 등록버튼
		$(".reply-write-button").click(function(){
			
			/* 댓글 등록 시작 */
			var content = $(".reply-write-content").text();
			var no = "${vo.no}";
			//alert(no);
			//alert(content);

			$.ajax({
				url : 'http://localhost:8080/coinweb/reply_write_check.do',
				type :'GET',
				data : 'content='+content+'&no='+no,
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){				
		
					if(data.length != 0){	
							
						$(".reply-write").css("display","none");
						$("#reply-write-check").val("hide");
						$(".reply-write-content").text("");
						
						reply_view_load();
					}						
				}
			});	//end of ajax			
		});	

		
		//댓글보기			
		$(".reply-view").click(function(){	
			
			//토글기능
			var check_value = $("#reply-content-check").val(); 
			
			if(check_value == "hide"){				
				$(".reply-content").css("display","inline-block");			
				$("#reply-content-check").val("show");
			}else{
				$(".reply-content").css("display","none");
				$("#reply-content-check").val("hide");
			}				
						
			var no = "${vo.no}";
			
			$.ajax({
				url : 'http://localhost:8080/coinweb/reply_list.do',
				method :'GET',	
				data : 'no='+no,
				dataType : 'json',
				success : function(data){
					$(".view1, .view2, .view3").remove();				
					for(i=0;i<data.length;i++){
						code = 	"<span class='view1'>"+data[i].rid+"</span>"
								+ "<span class='view2'>"+data[i].rdate+"</span>"
								+ "<div class='view3'>"+data[i].content+"</div>";					
						
						$(".reply-content").append(code);
					}
				}
			});
		});			
	});
	
	
	//사용자 정의 함수
	reply_view_load = function(){
			
			$(".reply-content").css("display","inline-block");			
			//$("#reply-content-check").val("show");
			
			var no = "${vo.no}";
			
			$.ajax({
				url : 'http://localhost:8080/coinweb/reply_list.do',
				method :'GET',	
				data : 'no='+no,
				dataType : 'json',
				success : function(data){
					$(".view1, .view2, .view3").remove();				
					for(i=0;i<data.length;i++){
						code = 	"<span class='view1'>"+data[i].rid+"</span>"
								+ "<span class='view2'>"+data[i].rdate+"</span>"
								+ "<div class='view3'>"+data[i].content+"</div>";					
						
						$(".reply-content").append(code);
					}
				}
			});
		};
	
</script>
<style>
	.reply-header { text-align:right;}
	.reply-title, .reply-view{ 			
		cursor:pointer;		
	}

	.reply-write { display:none;}
	.reply-write-title{
		text-align:left;
		padding:0px 0px 10px 10px;		
	}
	.reply-write-content{
		dispaly:inline-block;
		width:83%;
		height:100px;		
		float:left;	
		margin-left:10px;
		border:1px solid gray;	
		text-align:left;
		padding:3px;
	}
	.reply-write-button{
		dispaly:inline-block;
		width:14%;
		height:100px;
		line-height:100px;		
		float:right;
		background-color:lightGray;
		border:1px solid gray;	
		padding:3px 0px 3px 0px;
		margin-right:1.3px;
	}
	.reply-content{
		/*dispaly:none;*/
		width:100%;
		/*border:2px solid red;*/
		clear:right;
		margin-top:10px;
	}
	.view1, .view2, .view3 {border:1px solid gray; }
	.view1, .view2 {
		display:inline-block;
		width:45%;
		height:25px;
		text-align:left;
		background-color:#d9d9d9;
	}
	.view3 { 
		width:90%; height:40px; margin:auto;
		text-align:left;
	}
</style>

</head>





<body>
<jsp:include page="../header.jsp"></jsp:include> 
	
			<div class="freeboard_header">
			<h1 class="freeboard_header_h1">
			자유게시판</h1></div>
		
		
		<div class="container">	 
		
		 <div class="freeboard_content_title">
                        <p class="freeboard_content_title_text">${vo.title}</p>
                        <p class="freeboard_content_title_date">${vo.bdate}</p>
       	 </div>
		 <div class="freeboard_content_author">
                        <p class="freeboard_content_author_name">${vo.name}</p>
                        <div class="freeboard_content_author_info">
                            <p>조회수 <span class="author_info">${vo.hits}</span></p>
                            <p>좋아요 <span class="author_info like_count">${vo.likeit}</span></p>
                            <p>댓글 <span class="author_info">0</span></p>
                        </div>
         </div>	
				
			<div class="freeboard_content">
                        <p>
                        	${vo.content}
                        </p> </div>
					
					
					
				
					
					<div style="text-align: center;">
						<button class="likeitBtn btn-like btn" type="button" onclick="likeitBtnMain()">좋아요 <i class="fa fa-thumbs-up fa-lg"></i></button>
						<button class="dislikeitBtn btn-dislike btn" type="button" onclick="dislikeitBtnMain()">싫어요 <i class="fa fa-thumbs-down fa-lg"></i></button>
					</div>
					<div style="text-align: center;">
							<a href="/coinweb/freeboard.do?"><button type="button" class="btn btn-comm-con">이전 페이지</button></a>
							<a href="/coinweb/freeboard_update.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">수정하기</button></a>
							<a href="/coinweb/freeboard_delete.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">바로삭제</button></a>					
							<a href="/coinweb/index.do"><button type="button" class="btn btn-comm-con">홈으로</button></a>									
					</div>
					
			<!-- start of reply -->
			<table>
			
				<tr>
					<td colspan="8">
				
						<br><div class="reply-header">
						<span class="reply-title" id="btnReWrite">댓글작성</span>			
						|| <span class="reply-view">댓글보기</span>
						</div>			
						<div class="reply-write">
						
							<div class="reply-write-title">
							<input type="hidden" name="rname" id="rname" value="${rname }">		
							</div>
							<div contenteditable="true" class="reply-write-content" id="content"  name="content">
							</div>						
							<div class="reply-write-button">등록</div>
							<input type="hidden" id="reply-write-check" value="hide">
							<input type="hidden" name="no" value="${vo.no }">
						</div>												
					</td>
				</tr>
				<tr>
					<td colspan="8">						
						<div class="reply-content">	
						<input type="hidden" id="reply-content-check" value="hide">										
						</div>							
					</td>
				</tr>
				</table>
				<!-- end of reply -->	
					
						
			
					
		
					
		</div>	
	<jsp:include page="../footer.jsp"></jsp:include>  



<script>




$(function(){
	

 	//reply 
	/*덧글 처음부터 보이게 하기*/
	reply_total_size();
	reply_view_load();
	
	/*reply-re까지 설정*/
	/*덧글쓸때 아래 label 사라졌다 보여지는 감성*/	
	$(".reply-write-content").keyup(function(){
			var index =$(this).indexSearch();
		    
			if($("#reply-write-content"+index).text().length>0){
				$("#reply-write-title"+index).fadeOut(50);
				
			}if($("#reply-write-content"+index).text().length==0){
				$("#reply-write-title"+index).fadeIn(50);
				
			}				
		});
	/*reply-re까지 설정*/
	/*덧글 300자 제한*/		
	$(".reply-write-content").keyup(function(){	
		var index =$(this).indexSearch();

		$("#sizeLimit"+index).text($("#reply-write-content"+index).text().length);
					
			if($("#reply-write-content"+index).text().length>300){
				alert("글자수 300자까지\n입력할 수 있습니다.");
				var data =$("#reply-write-content"+index).text().substring(0,300);
				$("#reply-write-content"+index).text(data);
				$("#sizeLimit"+index).text($("#reply-write-content"+index).text().length);
			}
	});
	
	/*댓글 등록버튼*/
	$(".reply-write-buttonMain").click(function(){
		alert($(this).attr("id"));
		var index =$(this).indexSearch();
		alert(index);
		
		var content = $("#reply-write-content"+index).text();
		if(content == ""){
			alert("덧글 내용을\n입력해주세요.");
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
						//등록 시 덧글 아래 글씨 다시 띄우기
						$("#reply-write-content"+index).text("");
						$("#reply-write-title"+index).fadeIn(100);
					}
			});	
		}
		
	});	
		
	
	
});//end of ready fn


/* index뽑기 
 * 
 * id를 class+index로 만든 뒤 index 뽑을 때 사용  
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
					      "<span class='replyId'>id나올 곳</span>"+
					      "<div class='replyContent'>"+data[i].content+"</div>"+
					      "<span class='replyRdate'>"+data[i].rdate+"</span>"+
					      "<div class='replyTool'>"+
					      "<button id='replyBtnSub"+i+"' type='button' class='replyBtnSub replyBtn'>답글</button>"+
						  "<div class='replyBtnDiv'>"+
						  "<i class='fa fa-thumbs-o-up'></i><button id='replyBtnLikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnLikeit replyBtn'>"+data[i].likeit+"</button>"+	
						  "<i class='fa fa-thumbs-o-down'></i><button id='replyBtnDislikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnDislikeit replyBtn'>"+data[i].dislikeit+"</button>"+							
					      "</div>"+
						  "</div>"+
						  "</div>";
				   	
			
				$(".reply-content").append(code);
				}
				/*여기다 넣기*/
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
//	 			alert("누구에게\n좋아요를 눌렀습니다.");
//	 			$(".likeittd").text(response.likeit);		
//	 	});
	// } //btn

	
reply_likeit = function(){
		$(".replyBtnlikeit").click(function(){	
		var index = $(this).data("id");
		var rid = $("#rid"+index).val();
		alert("누구누구에게\n추천합니다");
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
		alert("누구누구에게\n반대합니다");
		var param ={'bid' : '${no}' , 'rid' :rid };
		MyAjax.excute('/coinweb/freeboardreply_dislikeit.json', param, 'POST').done(function(response){
			  $("#replyBtnDislikeit"+index).text(response.dislikeit);
		});
	});
};


/*좋아요 버튼 
 * 로그인 후 횟수 제한 걸어야한다.*/
function likeitBtnMain(){
	var param ={'no' : '${no}'};
	MyAjax.excute('/coinweb/freeboard_likeit.json', param, 'POST').done(function(response){
			alert("누구에게\n좋아요를 눌렀습니다.");
			$(".likeittd").text(response.likeit);		
	});
} //btn

function dislikeitBtnMain(){
	var param ={'no' : '${no}'};
	MyAjax.excute('/coinweb/freeboard_dislikeit.json', param, 'POST').done(function(response){
			alert("누구에게\n싫어요를 눌렀습니다.");
			$(".likeittd").text(response.likeit);		
	});			
}

	
</script>

	
	
</body>



</html>