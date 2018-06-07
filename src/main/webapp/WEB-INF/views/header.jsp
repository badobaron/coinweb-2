<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="coinweb.dao.*, coinweb.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="http://localhost:8080/coinweb/css/header.css">
<link rel="stylesheet" href="http://localhost:8080/coinweb/css/am-pagination.css">

<script src="http://localhost:8080/coinweb/js/jquery-3.3.1.min.js"></script>

<!-- pagination -->
<script src="http://localhost:8080/coinweb/js/am-pagination.js"></script>
<script src="http://localhost:8080/coinweb/js/paging.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript">jQuery.noConflict();</script>
<script>
jQuery(document).ready(function(){
	
	//아이디 저장 시작 
	$(function(){
		 getid();
		  $("#remember-me").click(function(){
		   saveid();
		  }); //#chkuser_id.click
		 }); //function(){
		  
		 function saveid() {
		   var expdate = new Date();
		   // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
		   if($("#remember-me").prop("checked")){
		    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
		   } else {
		    expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
		   }
		   setCookie("saveid", $("#signin-email").val(), expdate);
		 } //saveid()
		 
		 function setCookie (name, value, expires) {
		    document.cookie = name + "=" + escape (value) +"; path=/; expires=" + expires.toGMTString();
		  } //setCookie(name,value,expires)

		  function getCookie(Name) {
		    var search = Name + "=";
		    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
		      offset = document.cookie.indexOf(search);
		      if (offset != -1) { // 쿠키가 존재하면
		        offset += search.length;
		        // set index of beginning of value
		        end = document.cookie.indexOf(";", offset);
		        // 쿠키 값의 마지막 위치 인덱스 번호 설정
		        if (end == -1)
		          end = document.cookie.length;
		        return unescape(document.cookie.substring(offset, end));
		      }
		    }
		    return "";
		  } //getCookie(Name)

		 function getid() {
		  var saveId = getCookie("saveid");
		  if(saveId != "") {
		   $("#signin-email").val(saveId);
		   $("#remember-me").prop("checked",true);
		  }
		 } //getid()
	
	//아이디 저장 끝 
	
	jQuery("#btnLogin").click(function(){
		if(jQuery("#signin-email").val()==""){
			alert("아이디를 입력하세요.");
			jQuery("#signin-email").focus();
			return false;
		}else if(jQuery("#signin-password").val()==""){
			alert("패스워드를 입력하세요.");
			jQuery("#signin-password").focus();
			return false;
		}
		
		loginForm.submit();
		
	
	});
});
</script>

<script>
jQuery(document).ready(function(){
	

	jQuery("#btnJoin").click(function(){
		if(jQuery("#signup-email").val()==""){
			alert("이메일을 입력하세요.");
			jQuery("#signup-email").focus();
			return false;
		}else if(jQuery("#signup-username").val()==""){
			alert("닉네임을 입력하세요");
			jQuery("#signup-username").focus();
			return false;
		}else if(jQuery("#pass").val()==""){
			alert("비밀번호를 입력하세요.");
			jQuery("#pass").focus();
			return false;		
		}else if(jQuery("#cpass").val()==""){
			alert("비밀번호를 재입력 하세요.");
			jQuery("#cpass").focus();
			return false;
		}else if(jQuery("#agree").is(":checked") == false){
			alert("이용약관 및 개인정보 동의를 체크하세요.");
			jQuery("#agree").focus();
			return false;
		}
		
		//서버전송
		joinForm.submit();
		
		//비밀번호&비밀번호 확인 체크
	});
	jQuery("#cpass").focusout(function(){
		// 1.패스워드 입력폼이 비어있는지 확인  비어있지 않은 상태에서만 비교
		// 2. 1번의 결과중 비밀번호 확인폼이 비어있지 않은 상태에서만 비교를 진행 
		if(jQuery("#pass").val()=="" ){
			alert("패스워드를 입력하세요")
			jQuery("#pass").focus;
			return false;
		
		}else{
			if(jQuery("#cpass").val()!=""){			
			
				//비밀번호 & 비밀번호 확인 체크
				if(jQuery("#pass").val()== jQuery("#cpass").val()){
				jQuery("#msg").css("font-size","12pt").css("color","blue").css("display","block");
				jQuery("#msg").text("비밀번호가 동일합니다").css("padding","3px 0px 0px 0px");
				return false;
			}else{
				jQuery("#msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
				jQuery("#msg").text("비밀번호가 다릅니다. 다시 입력해주세요");
				jQuery("#pass").val("").focus();
				jQuery("#cpass").val("");
					return false;
		    }				
		 }			
		}	
	
});
	//아이디 중복체크 및 이메일 유효성검사 
	jQuery("#signup-email").focusout(function(){
		//alert("아이디 중복");
		var email = jQuery("#signup-email").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		//alert(id);
		
		jQuery.ajax({
			url : 'http://localhost:8080/coinweb/id_check.do',
			type :'POST',
			data : 'email='+email, 
			dataType : "json",
			success : function(data){
				if(data.length != 0){	
					//alert("있음"+data);
					
					if(jQuery("#signup-email").val()==""){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("이메일을 입력하세요.");
						jQuery("#signup-email").focus();
					}else if(exptext.test(email)==false){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("이메일 형식이 올바르지 않습니다.");
						jQuery("#signup-email").focus();
					}else if(data == 1){
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("중복된 이메일입니다.");
						jQuery("#signup-email").focus();						  
					}else{
						jQuery("#id_msg").css("display","block").css("font-size","12pt")
							.css("color","blue").css("padding","3px 0px 0px 0px");
						jQuery("#id_msg").text("사용가능한 이메일 입니다.");
						jQuery("#signup-username").focus();
					}
			
				}
			}
		});			
	});	//end of id_check	
	
	jQuery("#signup-username").focusout(function(){
		//alert("닉네임 중복 체크");
		var name = jQuery("#signup-username").val();
		//alert(name);
		
		$.ajax({
			url : 'http://localhost:8080/coinweb/name_check.do',
			type :'GET',
			data : 'name='+name,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){
				if(data.length != 0){	
					//alert("있음"+data);
					//alert(name);
	
					 if(data == 1){
						 jQuery("#name_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						 jQuery("#name_msg").text("중복된 닉네임입니다.");
						 jQuery("#signup-username").val("").focus();			
					}else{
					
						if(jQuery("#signup-username").val()==""){
							jQuery("#name_msg").css("display","block").css("font-size","12pt")
							.css("color","red").css("padding","3px 0px 0px 0px");
							jQuery("#name_msg").text("닉네임을 입력하세요.");
							//$("#signup-username").val("").focus();
						}else{
							jQuery("#name_msg").css("display","block").css("font-size","12pt")
							.css("color","blue").css("padding","3px 0px 0px 0px");
							jQuery("#name_msg").text("사용가능한 닉네임 입니다.");
							//jQuery("#pass").focus();
						}
						return false;
					}
			
				}
			}
		});			
	});	//end of id_check	
	
	/*비밀번호 자릿수 유효성검사 */
	
	jQuery("#pass").focusout(function(){
		var minimum = 8;
		var pass = jQuery("#pass").val().length;
	
		if(pass < minimum){
			jQuery("#msg")	.css("color","red").css("padding","3px 0px 0px 0px");
			jQuery("#msg").text("8자 이상 입력 하세요.");			
		}else{
			jQuery("#msg")	.css("color","red").css("padding","3px 0px 0px 0px");
			jQuery("#msg").text("");
		}

		return false;
	});
	
});
</script>
<script>                              
jQuery(document).ready(function(){
	var result = 0;

	jQuery("#pcbtn").click(function(){
		if(jQuery("#upass").val()==""){
			alert("현재 비밀번호를 입력하세요")
			return false;

		}else if(jQuery("#npass").val()==""){
			alert("새비밀번호를 입력하세요.");
			return false;
		}else if(jQuery("#ncpass").val()==""){
			alert("비밀번호를 재입력 하세요.");
			return false;
		}

		if(result==1)
			passUpdate.submit();
		else{
			alert("현재 비밀번호를 다시 입력해주세요");
			
			return false;
		}
	}); //end

	 jQuery("#upass").focusout(function(){
		 var email = jQuery("#uid").val();
		 var pass = jQuery("#upass").val();
		 
		 jQuery.ajax({
			 url : 'http://localhost:8080/coinweb/password_check.do',
			 type :'GET',
			 data : 'email='+email+'&pass='+pass,
			 dateType : "json",
			 success: function(data){
				 //alert(data);

					if(data != 1){
						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","red").css("padding","3px 0px 0px 0px");
						jQuery("#upw_msg").text("불일치!");
						jQuery("#upass").focus();
					
						return false; 		
					}else if (data == 1){
						jQuery("#upw_msg").css("display","block").css("font-size","12pt")
						.css("color","blue").css("padding","3px 0px 0px 0px");
						jQuery("#upw_msg").text("일치!");
						result = 1;
						return result; 

					}		
				 }
  		});
	});   

	 jQuery("#ncpass").focusout(function(){
			// 1.패스워드 입력폼이 비어있는지 확인  비어있지 않은 상태에서만 비교
			// 2. 1번의 결과중 비밀번호 확인폼이 비어있지 않은 상태에서만 비교를 진행 
			if(jQuery("#npass").val()=="" ){
				alert("패스워드를 입력하세요");

				return false;
			}else{
				if(jQuery("#ncpass").val()!=""){
					//비밀번호 & 비밀번호 확인 체크
					if(jQuery("#npass").val()== jQuery("#ncpass").val()){
					jQuery("#nupw_msg").css("font-size","12pt").css("color","blue").css("display","block");
					jQuery("#nupw_msg").text("비밀번호가 동일합니다.").css("padding","3px 0px 0px 0px");

					return false;

				}else{
					jQuery("#nupw_msg").css("font-size","12pt").css("color","red").css("display","block").css("padding","3px 0px 0px 0px");
					jQuery("#nupw_msg").text("비밀번호가 다릅니다. 다시 입력해주세요");
					jQuery("#pass").val("").focus();
					jQuery("#ncpass").val("");

					return false;
			    }
			 }
		  }
	});	 

	 /*비밀번호 자릿수 유효성검사 */
		jQuery("#npass").focusout(function(){
			var minimum = 8;
			var pass = jQuery("#npass").val().length;
		
			if(pass < minimum){
				jQuery("#nupw_msg")	.css("color","red").css("padding","3px 0px 0px 0px");
				jQuery("#nupw_msg").text("8자 이상 입력 하세요.");
				jQuery("#npass").focus();
				return false;
			}else{
				jQuery("#nupw_msg")	.css("color","red").css("padding","3px 0px 0px 0px");
				jQuery("#nupw_msg").text("");
				jQuery("#ncpass").focus();
				return false;
			}
		});
});
</script>
<body>
<header>
<!-- Navigation -->
<c:choose>	
<c:when test="${sid == null}">
<div class="topnav shadow" id="navbar">
	<div class="nav">
	  <a class="activea" href="http://localhost:8080/coinweb/index.do"><span>Coinweb</span></a>
	    <div class="topnav-right">
	         <div class="cd-main-nav__list js-signin-modal-trigger">
	             <a class="cd" href="http://localhost:8080/coinweb/business.do">거래하기</a>
	             <!-- inser more links here -->
	             <a class="cd-main-nav__item cd-main-nav__item--signin" href="#0" data-signin="login">로그인</a>
	             <a class="cd-main-nav__item cd-main-nav__item--signup" href="#0" data-signin="signup">회원가입</a>
				 <div class="dropdown">
				  	<button  class="dropbtn" href="#contact">커뮤니티<i class="fa fa-caret-down"></i></button>
				  	<div class="dropdown-content">
				 <a href="http://localhost:8080/coinweb/rangking.do">랭킹</a>
      			 <a href="http://localhost:8080/coinweb/freeboard.do">자유게시판</a>
     <!--   <a href="#">코인소식</a>-->
    </div>
   </div>
 	<div class="dropdown">
 	<button  class="dropbtn" href="#contact">고객센터<i class="fa fa-caret-down"></i></button>
 	 <div class="dropdown-content">
      <a href="http://localhost:8080/coinweb/guide.do">이용가이드</a>
      <a href="http://localhost:8080/coinweb/FAQ.do">FAQ</a>
      <a href="http://localhost:8080/coinweb/bbs.do">문의하기</a>
      
  
  	  </div>
  	  </div>
  	  </div>
 	 </div>
	</div>
		</div>
	    </c:when>
		<c:when test="${sid != null}">
	    <div class="topnav shadow" id="navbar">
	<div class="nav">
	
  <a class="activea" href="http://localhost:8080/coinweb/index.do"><span>Coinweb</span></a>
  
  <div class="topnav-right">
     <div class="cd-main-nav__list js-signin-modal-trigger">
    
    <a class="cd" href="http://localhost:8080/coinweb/business.do">거래하기</a>
		
				<!-- inser more links here -->
				<div class="dropdown">
				<button  class="dropbtn" href="#contact" id="nname">${name}<i class="fa fa-caret-down"></i></button>
	
				 <div class="dropdown-content">
      <a href="http://localhost:8080/coinweb/wallet.do">내 지갑</a>
      <a onclick="document.getElementById('id02').style.display='block'" style="width:auto; cursor: pointer;">비밀번호변경</a>
    </div>
    </div>
    <a class="cd-main-nav__item cd-main-nav__item--signin" href="http://localhost:8080/coinweb/logout.do" >로그아웃</a>
			<div class="dropdown">
 	<button  class="dropbtn" href="#contact">커뮤니티<i class="fa fa-caret-down"></i></button>
 	 <div class="dropdown-content">
      <a href="http://localhost:8080/coinweb/rangking.do">랭킹</a>
      <a href="http://localhost:8080/coinweb/freeboard.do">자유게시판</a>
     <!--   <a href="#">코인소식</a>-->
    </div>
   </div>
 	<div class="dropdown">
 	<button  class="dropbtn" href="#contact">고객센터<i class="fa fa-caret-down"></i></button>
 	 <div class="dropdown-content">
      <a href="http://localhost:8080/coinweb/guide.do">이용가이드</a>
      <a href="http://localhost:8080/coinweb/FAQ.do">FAQ</a>
      <a href="http://localhost:8080/coinweb/bbs.do">문의하기</a>
      
  
    </div>
    </div>
    </div>
  </div>
</div>
		</div>
</c:when>
</c:choose>
	<div class="cd-signin-modal js-signin-modal">
		<!-- this is the entire modal form, including the background -->
		<div class="cd-signin-modal__container">
			<!-- this is the container wrapper -->
			<ul
				class="cd-signin-modal__switcher js-signin-modal-switcher js-signin-modal-trigger">
				<li><a href="#0" data-signin="login" data-type="login" id="ll"
					class="fa fa-share" style="font-size: 22px">&nbsp;로그인</a></li>
				<li><a href="#0" data-signin="signup" data-type="signup"
					id="jj" class="fa fa-user-plus" style="font-size: 22px">&nbsp;회원가입</a></li>
			</ul>

			<div class="cd-signin-modal__block js-signin-modal-block"
				data-type="login">
				<!-- log in form -->
				<form name="loginForm"
					action="http://localhost:8080/coinweb/login.do" method="post"
					class="cd-signin-modal__form">
					<p class="cd-signin-modal__fieldset">


						<label
							class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
							for="signin-email">E-mail</label> <input
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
							name="email" id="signin-email" placeholder="E-mail">

					</p>

					<p class="cd-signin-modal__fieldset">
						<label
							class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
							for="signin-password">Password</label> <input
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
							name="pass" id="signin-password" type="password"
							placeholder="Password">

					</p>

					<p class="cd-signin-modal__fieldset">
						<input type="checkbox" id="remember-me"
							class="cd-signin-modal__input " name="chkuser_id"
							onClick="javascript:saveid(document.new_user_session);">
						<label for="remember-me">저장</label>
					</p>

					<p class="cd-signin-modal__fieldset">
						<button
							class="cd-signin-modal__input cd-signin-modal__input--full-width"
							id="btnLogin" type="submit">로그인</button>
					</p>
				</form>


			</div>
			<!-- cd-signin-modal__block -->

			<div class="cd-signin-modal__block js-signin-modal-block"
				data-type="signup">
				<!-- sign up form -->
				<form name="joinForm" action="http://localhost:8080/coinweb/join.do"
					method="post" class="cd-signin-modal__form">

					<p class="cd-signin-modal__fieldset">
						<label
							class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace"
							for="signup-email">E-mail</label> <input
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
							id="signup-email" name="email" type="email" placeholder="이메일 입력">
						<span id="id_msg"></span>
					</p>


					<p class="cd-signin-modal__fieldset">
						<label
							class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace"
							for="signup-username">Username</label> <input
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
							id="signup-username" name="name" type="text" placeholder="닉네임 입력">
						<span id="name_msg"></span>
					</p>



					<p class="cd-signin-modal__fieldset">
						<label
							class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
							for="signup-password">Password</label> <input
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
							id="pass" name="pass" type="password" placeholder="비밀번호 10자 이상입력">
						<span id="msg"></span>
					</p>
					<p class="cd-signin-modal__fieldset">
						<label
							class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace"
							for="signup-password">Password</label> <input
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border"
							id="cpass" type="password" placeholder="비밀번호 재입력">

					</p>

					<p class="cd-signin-modal__fieldset">
						<input type="checkbox" id="agree" name="agree"
							class="cd-signin-modal__input "> <label
							for="accept-terms">이용약관 및 개인정보 동의</a></label>
					</p>

					<p class="cd-signin-modal__fieldset">
						<button
							class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding"
							id="btnJoin" type="submit">회원가입</button>
					</p>

				</form>
			</div>
			<!-- cd-signin-modal__block -->



		</div>
		<!-- cd-signin-modal__container -->
	</div>
	<!-- cd-signin-modal --> <!-- password change modal -->

	<div id="id02" class="modal">
		<form class="modal-content animate" name="passUpdate"
			action="http://localhost:8080/coinweb/password_update_c.do"
			method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span>


			</div>

			<p>
			<h1 id="pc">&ensp;&ensp;&ensp;&ensp; 비밀번호 변경</h1>
			<div class="container">


				<input type="text" value="${email} " id="uid" disabled> 
				<input type="hidden" name="email" value="${email}" /> 
				<input type="password" placeholder="현재 비밀번호" id="upass"> 
				<span id="upw_msg"></span> 
				<input type="password" name="pass" placeholder="새 비밀번호" id="npass">
				<span id="nupw_msg"></span>
				<input type="password" placeholder="새 비밀번호 재입력" id="ncpass">
				<p id="p1">이메일 변경을 원하시는 경우 1:1 문의하기를 이용해 주세요.</p>
				<button type="submit" id="pcbtn">변경하기</button>
			</div>
		</form>
	</div>
	<!-- Navigation 끝 -->

</header>
</body>
<script src="http://localhost:8080/coinweb/js/main.js"></script>
<script src="http://localhost:8080/coinweb/js/test2.js"></script>

</html>
