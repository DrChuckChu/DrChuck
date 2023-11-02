<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>스크롤 템플릿 1</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!--cam-->
<script src="./cam.js"></script>
<script src="assets/css/cam.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/cam.css">
<!--cam end-->

<!-- head -->
<div id="kakaoHead" class="head_promo">
	<ul class="list_util2">
		<li><a href="#none" class="imgLogo">
		<img src="/img/최종_로고-배경제거.png"></a></li>
	</ul>


	<!-- 이벤트 메뉴 -->
	<strong class="screen_out">이벤트 메뉴</strong>
	<ul class="list_nav">
		<li class="on">
			<!-- 메뉴 활성 시 on 클래스 추가 --> <a href="#none" class="link_nav link_nav2"
			data-page="0">측정</a>
		</li>
		<li><a href="#none" class="link_nav link_nav3" data-page="1">실시간</a>
		</li>
		<li><a href="#none" class="link_nav link_nav4" data-page="2">기록
				확인</a></li>
		<li><a href="goList">${user.dmId}님 반가워요</a> <a href="goList">조회</a>
		</li>
		<li><a href="testLogOut">로그아웃</a> <a href="goUpdate">개인정보수정</a></li>

	</ul>
	<!-- // 이벤트 메뉴 -->

	<ul class="list_util">
		<li><a href="#none" class="img_comm btn_home"><img
				src="images/logo.png"></a></li>
	</ul>


</div>
<!--chart 부분 시작-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<style>
.chart-container {
	display: inline-block;
	width: 45%;
}

.right-chart {
	float: right;
}
</style>
<!--chart 부분 끝 -->
</head>



<body>



	<div id='image-container'></div>


	<c:if test="${!empty images}">
		<!-- Displaying the sImg -->
		<div class="image-upload">
			<label for="image-upload-1" class="custom-file-upload">
			<img src="${pageContext.request.contextPath}${images[1].dpReImg}" width="300px" />
			<div>경로는 뭘까용? ${images[1].dpReImg}</div>
			<div>${images[1].dpResult}</div>
			</label>
		</div>
		<div class="image-upload">
			<label for="image-upload-2" class="custom-file-upload">
			<img src="${pageContext.request.contextPath}${images[0].dpReImg}" width="300px" />
			<div>경로는 뭘까용 ?${images[0].dpReImg}</div>
			<div>${images[0].dpResult}</div>
			</label>
		</div>
	</c:if>

	</div>

	</div>

	</div>

	<div class="section_type1 page_scroll">
		<!--cam-->
		<div class="centered-container">
			<video id="cameraview" width="320" height="50"></video>
			<div class="toggleBG">
				<button class="toggleFG"></button>
			</div>
		</div>
		<script>
			mainInit();
		</script>
		<!--cam end-->
	</div>

	<div class="section_type3 page_scroll">
		<!--차트-->
		<div class="chart-container">
			<canvas id="chart"></canvas>
		</div>

		<div class="chart-container">
			<canvas id="pieExample"></canvas>
		</div>
		
		<div class="chart-container">
			<canvas id="myChart"></canvas>
		</div>

		<script src="assets/js/chart.js"></script>

	</div>

	</div>
	<!-- // content -->

	<hr class="hide">

	<!-- footer -->

	<!-- // footer -->
	</div>
	<!-- // prm_promo -->
	<script src="assets/js/main.js"></script>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/charttt.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>/*
		$(document).ready(function() {
 $("#upload-form").on("submit", function(e) {
    var fImg = document.querySelector('input[name="fImg"]');
    var sImg = document.querySelector('input[name="sImg"]');

    if (!fImg.files.length || !sImg.files.length) {
        alert("두 개의 이미지를 모두 선택해주세요.");
        e.preventDefault(); // Prevent the default form submission
        return;
    }
    
    
    var fExtension = fImg.value.split('.').pop().toLowerCase();
    var sExtension = sImg.value.split('.').pop().toLowerCase();

    var allowedExtensions = ['jpg', 'jpeg', 'png', 'bmp'];

    if (allowedExtensions.indexOf(fExtension) == -1 || allowedExtensions.indexOf(sExtension) == -1 ) {
        alert("JPG, JPEG, PNG 또는 BMP 형식의 이미지만 업로드할 수 있습니다.");
        e.preventDefault(); // Prevent the default form submission
        return;
    }
	
        var formData = new FormData(this); // Create a FormData object from the form

        $.ajax({
            url : "/upload",
            type : "POST",
            data : formData,
            processData : false,
            contentType : false,

            success : function(data) {
                location.reload();
            },
            error : function(xhr, status, error) {
                console.log(xhr.responseText); // Log the detailed response from server
           }
       });
   });

}); */
	</script> 
</body>
</html>

<head>
<meta charset="UTF-8">
<title>Mainpage</title>
<script	src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css">

<!-- 다크모드-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<!-- head -->
<div id="kakaoHead" class="head_promo">
	<ul class="list_util2">
		<li><a href="#none" class="imgLogo"><img
				src="images/logo.png"></a></li>
	</ul>

	<button id='darkModeToggle'>
		<i class='fas fa-moon'></i>
	</button>
	<!-- 이벤트 메뉴 -->
	<strong class="screen_out">이벤트 메뉴</strong>
	<ul class="list_nav">
		<li class="on"> <!-- 메뉴 활성 시 on 클래스 추가 --> 
		<a href="#none" class="link_nav link_nav1" data-page="0">소개</a>
		</li>
		<li>
		<a href="#none" class="link_nav link_nav2"	data-page="1">측정</a>
		</li>
		<li>
		<a href="#none" class="link_nav link_nav3" data-page="2">실시간</a>
		</li>
		<li>
		<a href="#none" class="link_nav link_nav4" data-page="3">기록 확인</a>
		</li>
		<li>
		<div id="timer1">5</div>
		</li>
		<li>
		<div id="timer1">5</div>
		</li>
		<li>
			<dir>${user.dmId}</dir>
		</li>

	</ul>
	<!-- // 이벤트 메뉴 -->
	<!-- 다크모드 -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

	<button class="alarm"><img src="images/알람아님.png"></button>
	
	<ul class="list_util">
		<li><a role="buttons" onclick="toggleContent()"
			class="img_comm btn_home"><img src="images/로그인로그아웃최종.png"></a></li>
	</ul>

	<div id="content">
		<div class="buttons">
			<a href="goUpdate">개인정보 수정</a>
		</div>
		<div class="buttons">
			<a href="logOut">로그아웃</a>
		</div>
		<div class="buttons">
			<a href="goodBye">회원 탈퇴</a>
		</div>
	</div>


</div>
<!--chart 부분 시작-->
<!--chart 부분 끝 -->
</head>
<body>


<div id="kakaoPromotion" class="prm_promo">

      <!-- // head -->


      <!-- content -->
      <div class="section_type4 page_scroll" id="aa">
        

         <div class="banner">
            <!-- 소중한 내 몸 -->
            <h1 class="shadowed-text" id="a3"><strong><span style="font-size: 50px;">소중한 내 몸,</span></strong></h1>
            <h1 class="shadowed-text" id="a4"><strong><span style="font-size: 50px;">어떤 고민이 있으신가요?</span></strong></h1>
  
            <!-- 국가대표 물리치료사 출신 트레이너들과 해결하세요! -->
            
            
            <!-- 해시태그 모음 배너 추가 -->
            <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">건강그램</span></strong></div>
            <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">자세교정</span></strong></div>
            <div class="custom-exercise"><strong>OPenCv</strong></div>
            <div class="custom-exercise2"><strong><span class="hash-symbol">#</span><span class="hash-contents">척추측만증</span></strong></div> </li>
            <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">거북목</span></strong></div> </li>
          <br>
          <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">건강</span></strong></div>
          <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">바른체형</span></strong></div>
          <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">관절통증</span></strong></div>
          <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">체력향상 프로그램</span></strong></div> </li>
          <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">해결</span></strong></div> </li>
          <div class="custom-exercise"><strong>실시간 알림</strong></div>
          <br>
          <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">척추박사</span></strong></div>
          <div class="custom-exercise"><strong>개인맞춤 운동</strong></div>
            <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">스마트인재개발원</span></strong></div>
            <div class="custom-exercise2"><strong><span class="hash-symbol">#</span><span class="hash-contents">바른자세</span></strong></div> </li>
            <br>
            <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">자세불균형</span></strong></div> </li>
            <div class="hashtag"><strong><span class="hash-symbol">#</span><span class="hash-contents">척추교정비용</span></strong></div> </li>
            <br>
            <br>
          <hr style="border-top-width:1px; border-color:rgba(255, 255, 255, 0.15);">
          <h3>저희 웹 사이트와 함께 해결하세요!</h3>
          <p>
              <img src="https://cdn.imweb.me/upload/S201902045c58294ab8c90/39b4224a11395.png" class="fr-fin fr-dib" style="width: 36px;" alt="화살표 아이콘">
            </p>

         </div>
      </div>
      </div>
