<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>스크롤 템플릿 1</title>
<!-- 다크모드-->


<!-- head -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="assets/js/styles.css">
</head>
<header>

<div id="kakaoHead" class="head_promo">
	<ul class="list_util2">
		<li><a href="#none" class="imgLogo"> <img
				src="images/logo.png"></a></li>
	</ul>

	<!-- 이벤트 메뉴 -->
	<strong class="screen_out">이벤트 메뉴</strong>
	<ul class="list_nav">
		<li class="on">
			<!-- 메뉴 활성 시 on 클래스 추가 --> <a href="#none" class="link_nav link_nav1"
			data-page="0">소개</a>
		</li>
		<li><a href="#none" class="link_nav link_nav2" data-page="1">측정</a>
		</li>
		<li><a href="#none" class="link_nav link_nav3" data-page="2">실시간</a>
		</li>
		<li><a href="#none" class="link_nav link_nav4" data-page="3">기록조회</a>
		</li>
		<li><a href="#none" class="link_nav link_nav5">${user.dmId }님
				ㅎㅇ</a></li>



	</ul>
	<button class="alarm">
		<img src="images/알람아님.png">
	</button>
	<!-- // 이벤트 메뉴 -->
	<!-- 다크모드 -->



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
</header>
<!--chart 부분 시작-->


<!--chart 부분 끝 -->
<body>
	<div id="kakaoPromotion" class="prm_promo">

		<!-- // head -->


		<!-- content -->
		<div class="section_type4 page_scroll" id="aa">


			<div class="banner">
				<!-- 소중한 내 몸 -->
				<h1 class="shadowed-text" id="a3">
					<strong><span style="font-size: 50px;">소중한 내 몸,</span></strong>
				</h1>
				<h1 class="shadowed-text" id="a4">
					<strong><span style="font-size: 50px;">어떤 고민이
							있으신가요?</span></strong>
				</h1>

				<!-- 국가대표 물리치료사 출신 트레이너들과 해결하세요! -->


				<!-- 해시태그 모음 배너 추가 -->
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">건강그램</span></strong>
				</div>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">자세교정</span></strong>
				</div>
				<div class="custom-exercise">
					<strong>OPenCv</strong>
				</div>
				<div class="custom-exercise2">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">척추측만증</span></strong>
				</div>
				</li>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">거북목</span></strong>
				</div>
				</li> <br>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">건강</span></strong>
				</div>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">바른체형</span></strong>
				</div>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">관절통증</span></strong>
				</div>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">체력향상 프로그램</span></strong>
				</div>
				</li>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">해결</span></strong>
				</div>
				</li>
				<div class="custom-exercise">
					<strong>실시간 알림</strong>
				</div>
				<br>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">척추박사</span></strong>
				</div>
				<div class="custom-exercise">
					<strong>개인맞춤 운동</strong>
				</div>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">스마트인재개발원</span></strong>
				</div>
				<div class="custom-exercise2">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">바른자세</span></strong>
				</div>
				</li> <br>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">자세불균형</span></strong>
				</div>
				</li>
				<div class="hashtag">
					<strong><span class="hash-symbol">#</span><span
						class="hash-contents">척추교정비용</span></strong>
				</div>
				</li> <br> <br>
				<hr
					style="border-top-width: 1px; border-color: rgba(255, 255, 255, 0.15);">
				<h3>저희 웹 사이트와 함께 해결하세요!</h3>
				<p>
					<img
						src="https://cdn.imweb.me/upload/S201902045c58294ab8c90/39b4224a11395.png"
						class="fr-fin fr-dib" style="width: 36px;" alt="화살표 아이콘">
				</p>

				<div style="margin-top: 400px;"></div>
			</div>
		</div>



		<div class="section_type2 page_scroll">

			<div class="image-upload">
				<form id="imageUploadForm" action="/upload" method="post"
					enctype="multipart/form-data">
					<label for="image-upload-1" class="custom-file-upload"> <img
						id="preview-1" src="images/앞모습 기본이미지.png" alt="앞모습 이미지를 첨부해주세요">
						<br> <input type="file" id="image-upload-1" accept="image/*"
						onchange="previewImage(this, 'preview-1')">
				</form>
			</div>


			<div class="image-upload">
				<form id="imageUploadForm" action="/upload" method="post"
					enctype="multipart/form-data">
					<label for="image-upload-2" class="custom-file-upload">
				</form>
				<img id="preview-2" src="images/옆모습기본이미지.png" alt="옆모습 이미지를 첨부해주세요">
				<br> <input type="file" id="image-upload-2" accept="image/*"
					onchange="previewImage(this, 'preview-2')">
				</form>
			</div>
		</div>

		<div class="upload_btn">
			<button class="btn_upload">업로드하기</button>
		</div>



		<div class="section_type1 page_scroll">
			<!--cam-->
			<div class="centered-container">
				<img id="cameraview" width="720" height="480" />
				<div class="toggleBG">
					<button class="toggleFG"></button>
				</div>
			</div>



		</div>


		<div class="section_type3 page_scroll">

			<!--업로드 결과-->
			<div class="uploadResult">

				<h6>측정 결과</h6>
				<c:if test="${empty images}">
					<div class="upload1"></div>
					<div class="upload2"></div>
					<div class="resultcontent">
						<p>안녕하세요 여기는 결과 피드백이 들어갈 자리예요</p>
					</div>
				</c:if>
				
				<c:if test="${!empty images}">
					<div class="upload1">
						<img src="${pageContext.request.contextPath}${images[1].dpReImg}"
							width="300px" />
						<div>${images[1].dpResult}</div>
					</div>
					<div class="upload2">
						<img src="${pageContext.request.contextPath}${images[0].dpReImg}"
							width="300px" />
						<div>${images[0].dpResult}</div>
					</div>
					<div class="resultcontent">
						<p style="font-size: 12px;">안녕하세요 여기는 결과 피드백이 들어갈 자리예요</p>
					</div>
				</c:if>

			</div>
			<br> <br>
			<!--스크롤 화살표-->
			<a class="scroll" href="#chart"><span></span></a> <br>

			<!--차트-->
			<div class="chartt">
				<div class="chart-container">
					<canvas id="chart"></canvas>
				</div>

				<div class="chart-container">
					<canvas id="pieExample"></canvas>
				</div>

				<div class="chart-container">
					<canvas id="pie-chart"></canvas>
				</div>

				<div class="chart-container">
					<canvas id="myChart2"></canvas>
				</div>

			</div>

			<div class="feedb">
				<p class="feedback-text">피드백:</p>
				<p class="feedback">내용</p>
			</div>
			<!-- // content -->

			<hr class="hide">

			<!-- footer -->


			<!-- // footer -->
		</div>
		<!-- // prm_promo -->
		<script	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		
		<script type='text/javascript'>
			$(document).ready(
					
							function() {
								var cameraView = document
										.getElementById("cameraview");
								var toggleButton = document
										.querySelector(".toggleBG");
								var toggleInner = document
										.querySelector(".toggleFG");
								var isCameraOn = false;

								toggleButton
										.addEventListener(
												'click',
												function() {
													if (!isCameraOn) {
														if (confirm("카메라 권한을 요청하려고 합니다. 허용하시겠습니까?")) {
															// Spring Controller에 웹캠 열기 요청 보내기
															$
																	.ajax({
																		url : "openWebcam",
																		type : "POST",
																		contentType : "application/json",
																		data : JSON
																				.stringify({
																					회원아이디 : "1234"
																				}),
																		success : function(
																				response) {
																			isCameraOn = true;
																			toggleButton.style.background = "#53FF4C";
																			toggleInner.style.left = "40px"; // 이동
																			cameraView.src = "http://172.30.1.96:5000/live_chu?"
																					+ new Date()
																							.getTime();
																			cameraView
																					.load(); // 웹캠을 다시 켤 때마다 영상을 로드
																		},
																		error : function() {
																			console
																					.error("웹캠 열기 요청이 실패했습니다.");
																		}
																	});

														}
													} else {
														// Spring Controller에 웹캠 닫기 요청 보내기
														$
																.ajax({
																	url : "closeWebcam",
																	type : "POST",
																	success : function(
																			data) {
																		console
																				.log(data);
																		isCameraOn = false;
																		toggleButton.style.background = "#CCCCCC";
																		toggleInner.style.left = "0px";
																		cameraView.src = "";
																	},
																	error : function() {
																		console
																				.error("웹캠 닫기 요청이 실패했습니다.");
																	}
																});
													}
												});

							});

			$('.btn_upload').on('click', function(event) {
				event.preventDefault();

				var formData = new FormData();
				formData.append('fImg', $('#image-upload-1')[0].files[0]);
				formData.append('sImg', $('#image-upload-2')[0].files[0]);
				formData.append('dpId', '${user.dmId}');

				$.ajax({
					url : 'upload',
					type : 'POST',
					data : formData,
					processData : false,
					contentType : false,
					success : function(data) {
						console.log('Upload successful!');
						
						// 업로드가 성공하면 이미지 정보를 요청
						$.ajax({
						    url: '/uploadRe/' + ${sessionScope.user.dmId},
						    type: 'GET',
						    success: function(data) {
						        // 서버로부터 받아온 이미지 데이터를 이용하여 이미지를 갱신
						        $('#preview-1').attr('src', data[0].dpReImg);
						        $('#preview-2').attr('src', data[1].dpReImg);
						        // 십할
						    },
						    error: function() {
						        console.log('Failed to fetch image data!');
						    }
						});
					},
					error : function() {
						console.log('Upload error!');
					}
				});
			});
		</script>

		<script>
			$(function() {
				var $banner = $('.banner'); // 배경을 변수에 넣기
				var $window = $(window);

				$window.on('scroll', function() { // 스크롤시
					var scrolled = $window.scrollTop() > 0; // 스크롤된 상태; true or false
					$banner.toggleClass('transparent', scrolled); // 클래스 토글
				});
			});
		</script>

		<script src="assets/js/main.js"></script>
		<script src="assets/js/chart.js"></script>
		<script src="assets/js/alarm.js"></script>
</body>
<footer>
<div class="footer-content">

	<br>
	<p>(PROJECT)척추박사</p>
	<p>
		Back-end : 김동영(팀장) <br>Back-end : 김현중(팀원) <br> Front-end :
		봉민혁(팀원) <br> Front-end : 문경진(팀원) <br> AI ML : 강진구(부팀장) <br>
		<br>Mentor : 전주형(신한AI)
	</p>

	<img class="footlogo" src="images/footerdr.png" alt="경진아 넣어줘"> <img
		class="smhrd" src="images/footer.png" alt="경진아 이미지도 보내야지">
</div>
</footer>

</html>