<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>DR.CHUCK-CHU</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.8.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="assets/css/main_fake.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<header>
	<div id="kakaoHead" class="head_promo">
		<ul class="list_util2">
			<li><a href="#none" class="imgLogo"><img
					src="images/최종_로고-배경제거.png"></a></li>
		</ul>


		<strong class="screen_out">이벤트 메뉴</strong>
		<ul class="list_nav">
			<li class="on"><a href="#none" class="link_nav link_nav1"
				data-page="0">소개</a></li>
			<li><a href="#none" class="link_nav link_nav2" data-page="1">측정</a>
			</li>
			<li><a href="#none" class="link_nav link_nav3" data-page="2">실시간</a>
			</li>
			<li><a href="#none" class="link_nav link_nav4" data-page="3">기록
					확인</a></li>

		</ul>
		<!-- 이벤트 메뉴-->
		<button class="alarm">
			<img src="images/알림이미지최종.png" alt="">
		</button>
		<ul class="list_util">
			<li><a role="buttons" onclick="toggleContent()"
				class="img_comm btn_home"><img
					src="images/로그인로그아웃최종.png"></a></li>
		</ul>


		<div id="content">
			<div class="buttons">
				<a href="#">개인정보 수정</a>
			</div>
			<div class="buttons">
				<a href="#">로그아웃</a>
			</div>
			<div class="buttons">
				<a href="#">회원 탈퇴</a>
			</div>
		</div>


	</div>
</header>

<body>
	<div id="kakaoPromotion" class="prm_promo">

		<!-- // head -->
		<div class="section_type4 page_scroll" id="aa">

			<!-- content -->
			<div onscroll="headerbarToggle()" class="banner">
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
					<strong><span class="hash-symbol2">#</span><span
						class="hash-contents2">척추측만증</span></strong>
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
					<strong><span class="hash-symbol2">#</span><span
						class="hash-contents2">바른자세</span></strong>
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

				<h2>
					<strong style="background-color: skyblue;">저희 웹 사이트와 함께
						해결하세요!</strong>
				</h2>
				<p>
					<a class="scroll2" href="#1"><span></span></a>
				</p>

				<div style="margin-top: 600px;">
					<h1>Test Content</h1>
					<p>This is a test content.</p>

				</div>
			</div>
		</div>
	</div>

	<div class="section_type2 page_scroll" id="1">

		
		<div class="image-upload">
			<form id="imageUploadForm" action="/upload" method="post"
				enctype="multipart/form-data">
				<label for="image-upload-1" class="custom-file-upload"> <img
					id="preview-1" src="images/앞모습 기본이미지.png" alt="앞모습 이미지를 첨부해주세요"> <br> <input
					type="file" id="image-upload-1" accept="image/*"
					onchange="previewImage(this, 'preview-1')">
				</label>
			</form>
		</div>

		<div class="image-upload">
			<form id="imageUploadForm2" action="/upload" method="post"
				enctype="multipart/form-data">
				<label for="image-upload-2" class="custom-file-upload"> <img
					id="preview-2" src="images/옆모습기본이미지.png" alt="옆모습 이미지를 첨부해주세요"> <br> <input
					type="file" id="image-upload-2" accept="image/*"
					onchange="previewImage(this, 'preview-2')">
				</label>
			</form>
		</div>

		<div class="center">
			<div class="spinner-border roadingStatus" id="roadingStatus"
				role="status" style="display: none;">
				<span class="sr-only">Loading...</span>
			</div>
		</div>

		<div class="upload_btn" id="buttonContainer">
		<form action="goLogin">
			<button class="btn_upload" id="testBtn" onclick="goLogin()">결과확인</button>
		</form>
		</div>

		<div id="modalContainer" class="hidden">
			<div id="modalContent">
				<img src="image1.jpg" alt="Image 1"> <img src="image2.jpg"
					alt="Image 2">
				<div>
					<button id="closeModal">종료</button>
				</div>
			</div>
		</div>

	</div>



	<div class="section_type1 page_scroll">
		<!--cam-->
		<form action="goLogin">
			<button>
				<img id="centerImage" src="images/잠금화면아이콘.png"
					alt="Description of image" width="150" height="150"
					onclick="goLogin()">
			</button>
		</form>
		<div id="fakeCam">
			<div class="centered-container">
				<img id="cameraview" width="720" height="480" />
				<div class="page-container">
					<div class="guide-container">
						<h6>올바른 앉은 자세</h6>
						<p>
							1. 등받이에 엉덩이와 허리 붙이기<br> (허리 과하게 젖히기 / 둥글게 말기 X)
						</p>

						<br>
						<p>2. 앉을 때 무게 중심은 엉덩이 중앙부에 위치 시키기</p>

						<br>
						<p>3. 발바닥은 땅에 닿도록 앉기</p>

						<br>
						<p>4. 시선은 모니터 상단에 맞추기</p>

						<br>
						<p>5. 손과 키보드는 책상끝에 위치</p>

						<br>
						<p>6. 턱을 당겨 귀, 어깨, 골반이 동일선상에 위치</p>
						<br>
						<p>🧘주기적으로 스트레칭하기🧘</p>

					</div>
					<div class="guide-container" style="display: none;">
						<h6>결과 예시</h6>
						<img src="/메인및로그인회원가입/img/삼진구.png">
						<p class="f">Good: 턱을 당겨 허리를 펴고 고개와 어깨가 기울어지지 않은 상태</p>
						<p class="f">Bad : 고개와 어깨가 기울어지거나 등받이에 과하게 기대어 화면과 멀어진 상태</p>
						<p class="f">Turtle : 고개를 과하게 앞으로 빼어 화면상 턱과 어깨선의 거리가 짧아진 상태이거나
							화면과 과하게 가까워 거북목 위험이 올라간 상태</p>
						<p class="f">그 외 : 화면과 일정 거리이상 멀어지거나 화면상에 아무도 없는 상태</p>
					</div>

					<div class="nav-buttons">
						<button id="prev-btn" disabled>1</button>
						<button id="next-btn">2</button>
					</div>

				</div>
				<div class="toggleBG">
					<button class="toggleFG"></button>
				</div>
			</div>
		</div>

	</div>
	</div>


	<div class="section_type3 page_scroll">
		<form action="goLogin">
			<button>
				<img id="centerImage2" src="images/잠금화면아이콘.png"
					alt="Description of image" width="150" height="150"
					onclick="goLogin()">
			</button>
		</form>
		<div id="fakeCam">
			<!--업로드 결과-->
			<div class="uploadResult">

				<h6 class="r">측정 결과</h6>

				<div class="upload1"></div>
				<div class="upload2"></div>
				<div class="resultcontent">
					<p>1안녕하세요 여기는 결과 피드백이 들어갈 자리예요</p>
				</div>
				<div class="resultcontent2">
					<p>2안녕하세요 여기는 결과 피드백이 들어갈 자리예요</p>
				</div>
			</div>
			<br> <br>
		</div>
		<form action="goLogin">
			<button>
				<img id="centerImage2" src="images/잠금화면아이콘.png"
					alt="Description of image" width="150" height="150"
					onclick="goLogin()">
			</button>
		</form>
		<div id="fakeCam">
			<!--스크롤 화살표-->
			<a class="scroll" href="#2"><span></span></a> <br>
			<!--차트-->
			<br> <br>
			<div id="2"></div>
			<div class="chartt">
				<div class="chart-container">
					<canvas id="chart"></canvas>
				</div>

				<div class="chart-container">
					<canvas id="pieExample"></canvas>
				</div>


				<div class="chart-container">
					<canvas id="myChart2"></canvas>
				</div>


				<div class="chart-container">
					<canvas id="pie-chart"></canvas>
				</div>


			</div>
		</div>

	</div>

	<!-- // content -->

	<hr class="hide">

	<!-- footer -->
	<!-- // footer -->
	</div>
	<!-- // prm_promo -->
	<script>
      $(function () {
         var $banner = $('.banner'); // 배경을 변수에 넣기
         var $window = $(window);

         $window.on('scroll', function () { // 스크롤시
            var scrolled = $window.scrollTop() > 0; // 스크롤된 상태; true or false
            $banner.toggleClass('transparent', scrolled); // 클래스 토글
         });
      });
   </script>
	<!--페이징-->
	<script>
      let currentPage = 0;
      const guideContainers = document.querySelectorAll('.guide-container');
      const prevBtn = document.getElementById('prev-btn');
      const nextBtn = document.getElementById('next-btn');
  
      function displayPage() {
          guideContainers.forEach((container, index) => {
              container.style.display = index === currentPage ? 'block' : 'none';
          });
          prevBtn.disabled = currentPage === 0;
          nextBtn.disabled = currentPage === guideContainers.length - 1;
      }
  
  
      displayPage();
  </script>

</body>

<footer>
	<div class="footer-content">

		<br>
		<p>(PROJECT)척추박사</p>
		<p>
			Back-end : 김동영(팀장) <br>Back-end : 김현중(팀원) <br> Front-end :
			봉민혁(팀원) <br> Front-end : 문경진(팀원) <br> AI ML : 강진구(부팀장)<br>
			<br> Mentor : 전주형(신한AI)
		</p>

		<img class="footlogo" src="images/footer글씨로고.png"> <img
			class="smhrd" src="images/스마트인재개발원푸터.png">
	</div>
</footer>
<script src="assets/js/main_fake.js"></script>
<script src="assets/js/chart.js"></script>






</html>