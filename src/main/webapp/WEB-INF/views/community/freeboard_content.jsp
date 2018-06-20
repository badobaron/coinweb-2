<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="coinweb.vo.BoardVO, coinweb.dao.BoardDAO, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- jQuery, bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="http://localhost:8080/coinweb/css/freeboard.css">
<!-- 리플 -->
<script src="http://localhost:8080/coinweb/js/MyAjax.js"></script>

<script>




(function($){
	
	$.fn.indexSearch = function(data){	
		return $(this).attr("id").slice($(this).attr("class").length);
	};	
})(jQuery);

	$(function(){
		
		
		//댓글쓰기 안내 사라지게 하기
		$(".reply-write-content").keyup(function(){
			var index =$(this).indexSearch();
		    
			if($(".reply-write-content"+index).text().length>0){
				$(".reply-write-title"+index).fadeOut(100);
				
			}if($(".reply-write-content"+index).text().length==0){
				$(".reply-write-title"+index).fadeIn(100);
				
			}				
		});
		
		
		//댓글숫자 체크
		$(".reply-write-content").keyup(function(){	
			var index =$(this).indexSearch();
	
			$("#sizeLimit"+index).text($(".reply-write-content"+index).text().length);
						
				if($(".reply-write-content"+index).text().length>300){
					alert("글자수 300자까지\n입력할 수 있습니다.");
					var data =$(".reply-write-content"+index).text().substring(0,300);
					$(".reply-write-content"+index).text(data);
					$("#sizeLimit"+index).text($(".reply-write-content"+index).text().length);
				}
		});


		

	});
	


$(document).ready(function(){			
	
		
		
		//댓글 등록버튼
		$(".reply-write-button").click(function(){
			
			/* 댓글 등록 시작 */
			var content = $(".reply-write-content").text();
			var rname = "${name}";
			var no = "${vo.no}";
	
			
			var content = $(".reply-write-content").text();
			if(content == ""){
				alert("댓글 내용을 입력해주세요.");
			}else{
			

			$.ajax({
				url : 'http://localhost:8080/coinweb/reply_write_check.do',
				type :'GET',
				data : 'rname='+rname+'&content='+content+'&no='+no,
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){				
		
					if(data.length != 0){	
									
						 location.reload();
					}						
				}
			});	
			}
		});	

		
//댓글보기			
$(function(){	
			
			
			var no = "${vo.no}";
			
			$.ajax({
				url : 'http://localhost:8080/coinweb/reply_list.do',
				method :'GET',	
				data : 'no='+no,
				dataType : 'json',
				success : function(data){
					$(".view1, .view2, .view3").remove();				
					for(i=0;i<data.length;i++){
						code = 	"<div class='replyDiv'>"+
					      "<input id='rid"+i+"' value='"+data[i].rid+"' name='rid' type='hidden'>"+
					      "<span class='view1'>"+data[i].rname +"</span>&nbsp;&nbsp;&nbsp;"+
					      "<span class='view3 replyRdate'>"+data[i].rdate +"</span>"+
					      "<div class='view2'>"+data[i].content+"</div>"+
					      
					      "<div class='replyTool'>"+

						  "<i class='fa fa-thumbs-o-up'></i><button id='replyBtnLikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnLikeit replyBtn'>"+data[i].likeit+"</button>"+	
						  "<i class='fa fa-thumbs-o-down'></i><button id='replyBtnLikeit"+i+"' data-id='"+i+"' type='button' class='replyBtnDislikeit replyBtn'>"+data[i].dislikeit+"</button>"+							
					    
						  "</div>"+
						  "</div>";				
						
						$(".reply-content").append(code);
					}
						
					reply_likeit();
					reply_dislikeit();
				}
			});
		});	

	});

function reply_likeit(){
		$(".replyBtnlikeit").click(function(){	
		alert("1");
		var index = $(this).data("id");
		var rid = $("#rid"+index).val();
		alert("${vo.name}님을 추천합니다");
		var param ={'bid' : '${no}' , 'rid' :rid };
		MyAjax.excute('/coinweb/freeboardreply_likeit.json', param, 'POST').done(function(response){
			$("#replyBtnLikeit"+index).text(response.likeit);
			
		});	
	});
};
	
function reply_dislikeit(){
	$(".replyBtnDislikeit").click(function(){
		var index = $(this).data("id");
		var rid = $("#rid"+index).val();
		alert("${vo.name}님을 반대합니다");
		var param ={'bid' : '${no}' , 'rid' :rid };
		MyAjax.excute('/coinweb/freeboardreply_dislikeit.json', param, 'POST').done(function(response){
			  $("#replyBtnDislikeit"+index).text(response.dislikeit);
		});
	});
};

</script>


</head>





<body>
<<<<<<< HEAD
	<jsp:include page="../header.jsp"></jsp:include>
=======
<jsp:include page="../header.jsp"></jsp:include> 
	
			<div class="freeboard_header">
			<h1 class="freeboard_header_h1">
			자유게시판</h1></div>
		
		
		<div class="container">	 
		
		 <div class="freeboard_content_title">
                        <p class="freeboard_content_title_text">${vo.title}</p>
                        <p class="freeboard_content_title_date">${vo.fbdate}</p>
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
							<a href="/coinweb/freeboard_update.do?no=${no}"><button type="button" class="btn btn-comm-con">수정하기</button></a>
							<a href="/coinweb/freeboard_delete.do?no=${no}"><button type="button" class="btn btn-comm-con">바로삭제</button></a>					
							<a href="/coinweb/index.do"><button type="button" class="btn btn-comm-con">홈으로</button></a>									
					</div>
					
			<!-- start of reply -->
			<div class="container">
			
							
						<br>
						<div>
						<span class="reply-title" id="btnReWrite"><strong>Comments</strong></span>		
						
						 </div>
							
							
							<div class="reply-write">
								<label id="reply-write-title" class="reply-write-title">
											댓글을 남겨주세요.
									</label>
								<div style="width: 100%; "  contenteditable="true" class="reply-write-content" id="content"  
								name="content" ></div>
							</div>	
								<div style="text-align: right; margin-top: 10px;">
								
									<span id="sizeLimit">0</span> /300 
									<button class="reply-write-button btn">등록</button>
								
								</div>
								
								<input type="hidden" id="reply-write-check" value="hide">
								<input type="hidden" name="no" value="${vo.no }">
							
			
																			
				
						<!-- 리플 리스트 -->				
						<div class="reply-content">	
						<input type="hidden" id="reply-content-check" value="hide">										
						</div>							
				
				
				</div>
				<!-- end of reply -->	
					
						
			
					
		
					
		</div>	
	<jsp:include page="../footer.jsp"></jsp:include>  
>>>>>>> 199e553c6c77654ee91ce7537902c88eb15530af

	<div class="freeboard_header">
		<h1 class="freeboard_header_h1">자유게시판</h1>
	</div>


	<div class="container">

		<div class="freeboard_content_title">
			<p class="freeboard_content_title_text">${vo.title}</p>
			<p class="freeboard_content_title_date">${vo.bdate}</p>
		</div>
		<div class="freeboard_content_author">
			<p class="freeboard_content_author_name">${vo.name}</p>
			<div class="freeboard_content_author_info">
				<p>
					조회수 <span class="author_info">${vo.hits}</span>
				</p>
				<p>
					좋아요 <span class="author_info like_count">${vo.likeit}</span>
				</p>
				<p>
					댓글 <span class="author_info">0</span>
				</p>
			</div>
		</div>

		<div class="freeboard_content">
			<p>${vo.content}</p>
		</div>





		<div style="text-align: center;">
			<button class="likeitBtn btn-like btn" type="button"
				onclick="likeitBtnMain()">
				좋아요 <i class="fa fa-thumbs-up fa-lg"></i>
			</button>
			<button class="dislikeitBtn btn-dislike btn" type="button"
				onclick="dislikeitBtnMain()">
				싫어요 <i class="fa fa-thumbs-down fa-lg"></i>
			</button>
		</div>
		<div style="text-align: center;">
			<a href="/coinweb/freeboard.do?"><button type="button"
					class="btn btn-comm-con">이전 페이지</button></a> <a
				href="/coinweb/freeboard_update.do?no=${no}&rno=${rno}"><button
					type="button" class="btn btn-comm-con">수정하기</button></a> <a
				href="/coinweb/freeboard_delete.do?no=${no}&rno=${rno}"><button
					type="button" class="btn btn-comm-con">바로삭제</button></a> <a
				href="/coinweb/index.do"><button type="button"
					class="btn btn-comm-con">홈으로</button></a>
		</div>

		<!-- start of reply -->
		<div class="container">


			<br>
			<div>
				<span class="reply-title" id="btnReWrite"><strong>Comments</strong></span>

			</div>


			<div class="reply-write">
				<label id="reply-write-title" class="reply-write-title"> 댓글을
					남겨주세요. </label>
				<div style="width: 100%;" contenteditable="true"
					class="reply-write-content" id="content" name="content"></div>
			</div>
			<div style="text-align: right; margin-top: 10px;">

				<span id="sizeLimit">0</span> /300
				<button class="reply-write-button btn">등록</button>

			</div>

			<input type="hidden" id="reply-write-check" value="hide"> <input
				type="hidden" name="no" value="${vo.no }">




			<!-- 리플 리스트 -->
			<div class="reply-content">
				<input type="hidden" id="reply-content-check" value="hide">
			</div>


		</div>
		<!-- end of reply -->






	</div>
	<jsp:include page="../footer.jsp"></jsp:include>



	<script>


/*좋아요 버튼 
 * 로그인 후 횟수 제한 걸어야한다.*/
function likeitBtnMain(){
	var param ={'no' : '${no}'};
	MyAjax.excute('/coinweb/freeboard_likeit.json', param, 'POST').done(function(response){
			alert("${vo.name}님에게 좋아요를 눌렀습니다.");
			$(".likeittd").text(response.likeit);		
	});
} //btn

function dislikeitBtnMain(){
	var param ={'no' : '${no}'};
	MyAjax.excute('/coinweb/freeboard_dislikeit.json', param, 'POST').done(function(response){
			alert("${vo.name}님에게 싫어요를 눌렀습니다.");
			$(".likeittd").text(response.likeit);		
	});			
}




	
</script>



</body>



</html>