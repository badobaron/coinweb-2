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
						<th>번호</th>						
						<td>${rno}</td>
						<th>제목</th>
						<td>${vo.title}</td>
						<th>등록날짜</th>
						<td>${vo.bdate}</td>
						<th>조회수</th>
						<td>${vo.hits}</td>
						<th>추천</th>
						<td class="likeittd">${vo.likeit}</td>										
					</tr>
					<tr>
						<th colspan="10">
						${vo.content}
						</th>
					</table>
					
					<div style="text-align: center;">
						<button class="likeitBtn btn-like" type="button">좋아요</button>
						<button class="dislikeitBtn btn-dislike" type="button">싫어요</button>
					</div>
					<div style="text-align: center;">
							<a href="/coinweb/freeboard.do?"><button type="button" class="btn btn-comm-con">이전 페이지</button></a>
							<a href="/coinweb/freeboard_update.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">수정하기</button></a>
							<a href="/coinweb/freeboard_delete.do?no=${no}&rno=${rno}"><button type="button" class="btn btn-comm-con">바로삭제</button></a>					
							<a href="/coinweb/index.do"><button type="button" class="btn btn-comm-con">홈으로</button></a>									
					</div>
					<%--reply 세션으로 id 받아오면 id로 취하는 값들 노출시켜야함. 데이타베이스에 id 기입하는 열도 만들어야한다 --%>
						<div class="reply-write-main">
							<div class="reply-header">
								
								<p>전체 댓글 <span id="replyNum"></span></p>
								<span>'ID 나올 곳'</span> 
							</div>			
							<div class="reply-write" style="border: 1px solid rgb(216, 216, 216); position: relative; height: 110px;">
								<div>
									<label class="reply-write-title" style="position: absolute; z-index: -10;color: #d9d9d9;">
											저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 단어들은 표시가 제한됩니다.
									</label>
								</div>
								<div contenteditable="true" class="reply-write-content" name="content" style="height: 50px;"></div>
		
								<div style="text-align: right;">
									<p> <span id="sizeLimit">0</span> /300</p>
									<button class="reply-write-button btn btn-comm-con" style=" position: absolute; right :3px; top :70px; background-color: MediumSeaGreen; color: white; width: 100px;">등록</button>					
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
	/*좋아요 버튼 
	 * 로그인 후 횟수 제한 걸어야한다.*/
	$(".likeitBtn").click(function(){
		$.ajax({
			url : '/coinweb/freeboard_likeit.do',
			method :'POST',	
			data : 'no=${no}',
			dataType : 'json',
			success : function(data){
				var org = data.likeit;
				alert("누구에게 좋아요를 눌렀습니다.");
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
				alert("누구에게 싫어요를 눌렀습니다.");
 				$(".likeittd").text(org);
			}
		});	//ajax			
	}); //btn

 	//reply 
	/*덧글 처음부터 보이게 하기*/
	reply_total_size();
	reply_view_load();
	
	/*덧글쓸때 아래 label 사라졌다 보여지는 감성*/	
	$(".reply-write-content").keyup(function(){
			
			if($(".reply-write-content").text().length>0){
				$(".reply-write-title").fadeOut(100);
				
			}if($(".reply-write-content").text().length==0){
				$(".reply-write-title").fadeIn(100);
				
			}				
		});

	/*덧글 300자 제한*/		
	$(".reply-write-content").keyup(function(){	

		$("#sizeLimit").text($('.reply-write-content').text().length);
					
			if($(".reply-write-content").text().length>300){
				alert("글자수 300자까지 입력할 수 있습니다.");
				var data =$(".reply-write-content").text().substring(0,300);
				$(".reply-write-content").text(data);
				$("#sizeLimit").text($('.reply-write-content').text().length);
			}
	});
	
	/*댓글 등록버튼*/
	$(".reply-write-button").click(function(){
		
		var content = $(".reply-write-content").text();
		if(content == ""){
			alert("덧글 내용을 입력해주세요.");
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
						//등록 시 덧글 아래 글씨 다시 띄우기
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
					"<span class='replyId'>id나올 곳</span>"+
					"<div class='replyContent'>"+data[i].content+"</div>"+
					"<span class='replyRdate'>"+data[i].rdate+"</span>"+
					"<div class='replyTool'>"+
					"<button id='replyBtnSub"+i+"' type='button' class='replyBtnSub replyBtn'>답글</button>"+
					"<div class='replyBtnDiv'>"+
					"<i class='fa fa-thumbs-o-up'></i><button id='replyBtnLikeit"+i+"' type='button' class='replyBtnLikeit replyBtn'>"+data[i].likeit+"</button>"+	
					"<i class='fa fa-thumbs-o-down'></i><button id='replyBtnDislikeit"+i+"' type='button' class='replyBtnDislikeit replyBtn'>"+data[i].dislikeit+"</button>"+							
				    "</div></div></div>";	
				$(".reply-content").append(code);
				}
				/*여기다 넣기*/
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
		//index 값만 추출
		var index = $(this).attr("id").slice(14);
		var rid = $("#rid"+index).val();
		alert("누구누구에게 추천합니다");
			
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
		//index 값만 추출
		var index = $(this).attr("id").slice(17);
		var rid = $("#rid"+index).val();
		alert("누구누구에게 반대합니다");
			
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