<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>스크롤 템플릿 1</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
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
					확인</a> <a hidden="none" id=timer1>5</a> <a hidden="none" id=timer2>5</a>
			</li>

		</ul>
		<!-- 이벤트 메뉴-->
		<button class="alarm">
			<img src="images/알람오프.png">
		</button>
		<ul class="list_util">
			<li><a role="buttons" onclick="toggleContent()"
				class="img_comm btn_home"><img src="images/로그인로그아웃최종.png"></a>
			</li>
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
					id="preview-1" src="images/앞모습 기본이미지.png" alt="앞모습 이미지를 첨부해주세요">
					<br> <input type="file" id="image-upload-1" accept="image/*"
					onchange="previewImage(this, 'preview-1')">
				</label>
			</form>
		</div>

		<div class="image-upload">
			<form id="imageUploadForm2" action="/upload" method="post"
				enctype="multipart/form-data">
				<label for="image-upload-2" class="custom-file-upload"> <img
					id="preview-2" src="images/옆모습기본이미지.png" alt="옆모습 이미지를 첨부해주세요">
					<br> <input type="file" id="image-upload-2" accept="image/*"
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
			<button class="btn_upload">업로드하기</button>
		</div>

		<div id="modalContainer" class="hidden">
			<div id="modalContent">
				<div class="upload3">
					<img src="" />
				</div>
				<div class="upload4">
					<img src="" />
				</div>
				<div>
					<button id="closeModal">종료</button>
				</div>
			</div>
		</div>

		<div id="modalContainer" class="hidden">
			<div id="modalContent">
				<div class="upload3">
					<img src="">
					<button id="closeModal">종료</button>
				</div>
				<div class="upload4">
					<img src="">
				</div>
			</div>
			<div></div>
		</div>


	</div>



	<div class="section_type1 page_scroll">
		<!--cam-->
		<div class="centered-container">
			<img id="cameraview" width="720" height="480" />
			<div class="guide-container">
				<h6>올바른 자세 예시</h6>
				<p>
					1. 등받이에 엉덩이와 허리 붙이기<br> 2. 발바닥은 땅에 닿도록 앉기<br> 3. 모니터 눈높이는
					모니터 상단에 맞추기<br> 4. 팔꿈치 각도는 직각으로 유지하기<br> 5. 머리는 턱을 당겨 어깨와
					동일 선상으로 유지하기<br>
				<p>🧘주기적으로 스트레칭하기🧘</p>
			</div>
			<div class="toggleBG">
				<button class="toggleFG"></button>

			</div>

		</div>



	</div>


	<div class="section_type3 page_scroll">

		<!--업로드 결과-->
		<div class="uploadResult">

			<h6 class="r">측정 결과</h6>

			<div class="upload1">
				<img src="" />
			</div>
			<div class="upload2">
				<img src="" />
			</div>
			<div class="resultcontent">1안녕하세요 여기는 결과 피드백이 들어갈 자리예요</div>
			<div class="resultcontent2">2안녕하세요 여기는 결과 피드백이 들어갈 자리예요</div>
		</div>




		<br> <br>
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
			<div class="feedback-container">
				<div id = "fdId">
				</div>
				<div id="fdTxt">
				</div>
				<div id="fdG">
				</div>
				<div id="fdB">
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

	<script>
	$(document).ready(function() {
		var cameraView = document.getElementById("cameraview");
		var toggleButton = document.querySelector(".toggleBG");
		 var toggleInner = document.querySelector(".toggleFG");
		var isCameraOn = false;

		toggleButton.addEventListener('click', function() {
			
		   if (!isCameraOn) {
		      if (confirm("카메라 권한을 요청하려고 합니다. 허용하시겠습니까?")) {
		         // Spring Controller에 웹캠 열기 요청 보내기
		         $.ajax({
		            url: "openWebcam",
		            type: "POST",
		            contentType: "application/json",
		            data: JSON.stringify({ 회원아이디 : "1234" }),
		            success: function(response) {
		               isCameraOn = true;
		               toggleButton.style.background = "#53FF4C";
		               toggleInner.style.left = "40px"; // 이동
		                     cameraView.src = "http://172.30.1.55:5000/live_chu?" + new Date().getTime();
		            },
		            error: function() { console.error("웹캠 열기 요청이 실패했습니다."); }
		         });
		      }
		     } else {  
		         // Spring Controller에 웹캠 닫기 요청 보내기
		         $.ajax({
		             url: "closeWebcam",
		             type: "POST",
		             success:function(data){
		                 console.log(data);
		                 isCameraOn=false;
		                 toggleButton.style.background="#CCCCCC";
		                 toggleInner.style.left = "0px"; // 이동
		                 cameraView.src = "";
			             location.reload()
		             },
		             error:function(){console.error("웹캠 닫기 요청이 실패했습니다.");}
		         });
		     }
		 });
		
		// 이미지 업로드 버튼 클릭 이벤트
	    $('.btn_upload').on('click', function(event) {
	        event.preventDefault();
	        
	        
	        var formData = new FormData();
	        formData.append('fImg', $('#image-upload-1')[0].files[0]);
	        formData.append('sImg', $('#image-upload-2')[0].files[0]);
	        formData.append('dpId', '${user.dmId}');

	        // 로딩 화면 보여주기
	        showLoading();
			// 이미지를 db에 넣는거 실행
	        $.ajax({
	            url : 'upload',
	            type : 'POST',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(data) {
	                console.log('Upload successful!');
	                // db에 넣은거 jsp에서 실행
	                
	                $.ajax({
	                    url: 'uploadRe',
	                    type: 'GET',
	                    success: function(data) {
	                        console.log("이미지 들어오냐?");
	                        console.log(data);

	                        $('.upload3 img').attr('src', '${pageContext.request.contextPath}' + data[1].dpReImg);
	                        $('.upload4 img').attr('src', '${pageContext.request.contextPath}' + data[0].dpReImg);
	                        
	                        // 로딩 화면 숨기기
	                        hideLoading();

	                        // 모달창 보여주기
	                        document.getElementById('modalContainer').classList.remove('hidden');

	                        // 모달창 닫기 버튼 이벤트 리스너 추가
	                        const closeModal = document.getElementById('closeModal');
	                        closeModal.addEventListener('click', () => {
	                            document.getElementById('modalContainer').classList.add('hidden');
	                            // 모달창 닫을 경우 모달창에 갱신된 이미지를 다시 결과 이미지 피드백으로 넘겨주기
	                            $.ajax({
	                                url: "resultImg",
	                                type: "GET",
	                                success: function(data) {
	                                    console.log("이미지 넣어버리기");
	                                    console.log(data);
	                                    $('.upload1 img').attr('src', '${pageContext.request.contextPath}' + data[1].dpReImg);
	                                    $('.upload2 img').attr('src', '${pageContext.request.contextPath}' + data[0].dpReImg);
	                                    
	                                    var result1 = data[1].dpResult.split(",");
	                                    var result2 = data[0].dpResult.split(",");
	                                    console.log(result1)
	                      				console.log(result2)
	                      				$('.resultcontent').html(
	                      				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[0] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[1] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[2] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[3] + '</span></p>' +
	                       				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[4] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[5] + '<br></span><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[6] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[7] + '</span></p>' +
	                     				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[9] + result1[10] + '</span></p>');
	                     				$('.resultcontent2').html(
	                      				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[0] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result2[1] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[2] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result2[3] + '</span></p>' +
	                       				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[4] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result2[5] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[6] + '<br></span><span style="color: blue; font-size: 20px; line-height: 24px;">' + result2[7] + '</span></p>' +
	                     				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[9] + result2[10] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[11] + '<br>'+result2[12]+ result2[13]+ result2[14]+'</span>');
	                                },
	                                error:function(){console.error("결과피드백 실패");}
	                            });   
	                              
	                            
	                            
	                            //location.reload();
	                        });
	                    },
	                    error: function() {
	                        console.log('이미지 데이터를 가져오지 못했습니다!');
	                    }
	                });
	            },
	            error : function() {
	                console.log('Upload error!');
	            }
	        });
	    });

	    function showLoading(){
	        console.log('showLoading function called');
	        var maskHeight = $(document).height();
	        var maskWidth  = window.document.body.clientWidth;
	        var mask ="<div id='mask' style='position:absolute; z-index:10000; background-color:#000000; left:0; top:0;'></div>";
	        $('body').append(mask)
	        $('#mask').css({
	            'width' : maskWidth,
	            'height': maskHeight,
	            'opacity' :'0.7'
	        });

	        $("#roadingStatus").show();
	    }

	    function hideLoading(){
	        console.log('hideLoading function called');
	        $("#mask").remove();
	        $("#roadingStatus").hide();
	    }
   });
	
	// 결과 이미지 보여주는잭슨
	   $.ajax({
           url: "feedImg",
           type: "GET",
           success: function(data) {
               console.log("이미지 넣어버리기");
               console.log(data);
               if(data.length === 1){
            	   console.log(data.length)
               $('.upload1 img').attr('src', '${pageContext.request.contextPath}' + data[1].dpReImg);
               $('.upload2 img').attr('src', '${pageContext.request.contextPath}' + data[0].dpReImg);
               
               var result1 = data[1].dpResult.split(",");
               var result2 = data[0].dpResult.split(",");
               console.log(result1)
 				console.log(result2)
 				$('.resultcontent').html(
 				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[0] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[1] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[2] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[3] + '</span></p>' +
  				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[4] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[5] + '<br></span><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[6] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result1[7] + '</span></p>' +
				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result1[9] + result1[10] + '</span></p>');
				$('.resultcontent2').html(
 				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[0] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result2[1] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[2] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result2[3] + '</span></p>' +
  				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[4] + '</span><span style="color: red; font-size: 14px; line-height: 24px;">' + result2[5] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[6] + '<br></span><span style="color: blue; font-size: 20px; line-height: 24px;">' + result2[7] + '</span></p>' +
				 '<p style="font-size: 14px; line-height: 24px;"><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[9] + result2[10] + '</span><span style="color: black; font-size: 14px; line-height: 24px;">' + result2[11] + '<br>'+result2[12]+ result2[13]+ result2[14]+'</span>');
               }else{
            	   $('.upload1 img').attr('src', 'images/앞모습 기본이미지.png');
                   $('.upload2 img').attr('src', 'images/옆모습기본이미지.png');  
            	   
                   console.log(result1)
     				console.log(result2)
     				$('.resultcontent').html("아직 등록된 업로드 자세측정이 없습니다")
    				$('.resultcontent2').html("아직 등록된 업로드 자세측정이 없습니다")
               }
           },
           error:function(){console.error("결과피드백 실패");}
       });
	
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
<script src="assets/js/main.js"></script>
<script src="assets/js/alarm.js"></script>
<script src="assets/js/chart.js"></script>
<script src="assets/js/jquery.min.js"></script>

</html>