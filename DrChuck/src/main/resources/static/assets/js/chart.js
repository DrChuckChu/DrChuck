$(document).ready(function() {
	// 바 차트

	function drawChart() {
		$.ajax({
			url: 'myChart',
			method: 'GET',
			success: function(response) {

				// 데이터 받아오기
				var data = response;
				if (myChart) {
					myChart.destroy();
				}
				// 차트 그리기
				var myChartCtx = document.getElementById('chart').getContext('2d');
				var maxData = Math.max(...data.good.concat(data.bad, data.turtle));
				var yMax = maxData > 0 ? Math.ceil(maxData / 10) * 10 + 10 : 10;

				var myChart = new Chart(myChartCtx, {
					type: 'bar',
					data: {
						labels: data.labels,
						datasets: [{
							label: '좋은 자세',
							data: data.good,
							backgroundColor: "rgb(0,200,0)",
							borderColor: "rgb(0,200,0)",
							borderWidth: 1
						}, {
							label: '나쁜 자세',
							data: data.bad,
							backgroundColor: "rgb(255,51,51)",
							borderColor: "rgb(255,51,51)",
							borderWidth: 1
						}, {
							label: '거북목',
							data: data.turtle,
							backgroundColor: 'rgb(51,154,255)',
							borderColor: 'rgb(51,154,255)',
							borderWidth: 1
						}
						]
					},
					options: {
						scales: {
							yAxes: [{
								scaleLabel: {
									display: true,
									labelString: '횟수',
								},
								ticks: {
									beginAtZero: true,
									min: 0,
									max: yMax
								}
							}]
						},
						title: {
							display: true,
							text: '실시간 시간별 통계',
							fontSize: 18
						}
					}
				});
			},
			error: function(xhr, status, error) {
				// 에러 처리
				console.error('HTTP 상태 코드: ' + xhr.status);
				console.error('상태 텍스트: ' + xhr.statusText);
				console.error('발생한 예외: ' + error);
			}

		});
	}
	drawChart();

	// 이후에 5초마다 차트 갱신
	setInterval(drawChart, 60000);

	// 파이차트 실시간 일일 통계
	function drawPieChart() {
		$.ajax({
			url: 'pieChart',
			method: 'GET',
			success: function(response) {

				// 데이터 받아오기
				var data = response;
				// 데이터를 숫자로 변환
				var good = parseInt(data.good, 10) || 0; // 변환에 실패하면 0을 사용
				var bad = parseInt(data.bad, 10) || 0; // 변환에 실패하면 0을 사용
				var turtle = parseInt(data.turtle, 10) || 0; // 변환에 실패하면 0을 사용
				// 데이터 합산
				var total = good + bad + turtle;
				// 비율 계산
				var goodPercentage = total === 0 ? 0 : ((good / total) * 100).toFixed(2);
				var badPercentage = total === 0 ? 0 : ((bad / total) * 100).toFixed(2);
				var turtlePercentage = total === 0 ? 0 : ((turtle / total) * 100).toFixed(2);
				var labels = ['좋은 자세', '나쁜 자세', '거북목'];
				var percentages = [goodPercentage, badPercentage, turtlePercentage];
				// 차트 그리기
				var pieChartCtx = document.getElementById('pieExample').getContext('2d');
				var pieChart = new Chart(pieChartCtx, {
					type: 'pie',
					data: {
						labels: labels.map((label, i) => `${label} ${percentages[i]}%`),
						datasets: [{
							data: [good, bad, turtle],
							backgroundColor: ['rgb( 0,200,0)', 'rgb(255,51,51)', 'rgb(51,154,255)'],
							borderColor: ['rgb( 0,200,0)', 'rgb(255,51,51)', 'rgb(51,154,255)'],
							borderWidth: 1
						}]
					},
					options: {
						title: {
							display: true,
							text: '실시간 일일 통계',
							fontSize: 18
						},
						legend: {
							position: 'top'
						},
						tooltips: {
							callbacks: {
								label: function(tooltipItem, data) {
									var label = labels[tooltipItem.index];
									var dataset = data.datasets[tooltipItem.datasetIndex];
									var currentValue = dataset.data[tooltipItem.index];
									return label + ": " + currentValue + "개"; // "항목: 갯수 개 (비율%)" 형태로 표시
								}
							}
						}
					}
				});
			},
			error: function(xhr, status, error) {
				// 에러 처리
				console.error('차트2 HTTP 상태 코드: ' + xhr.status);
				console.error('차트2 상태 텍스트: ' + xhr.statusText);
				console.error('차트2 발생한 예외: ' + error);
			}
		});
	}

	drawPieChart();

	// 이후에 5초마다 차트 갱신
	setInterval(drawPieChart, 60000);

	// 전일통계
	$.ajax({
		url: 'donutChart',
		method: 'GET',
		success: function(response) {

			// 데이터 받아오기
			var data = response.data;
			var labels = response.labels;

			// 비율 계산
			var total = data.reduce((a, b) => a + b, 0);
			var percentages = data.map(value => total === 0 ? 0 : ((value / total) * 100).toFixed(2));

			// 차트 그리기
			var donutChartCtx = document.getElementById('pie-chart').getContext('2d');
			var donutChart = new Chart(donutChartCtx, {
				type: 'doughnut',
				data: {
					labels: labels.map((label, i) => `${label} ${percentages[i]}%`),
					datasets: [{
						data: data,
						backgroundColor: ['rgb( 0,200,0)', 'rgb(255,51,51)', 'rgb(51,154,255)', "rgb(255,174,60)"],
						borderColor: ['rgb( 0,200,0)', 'rgb(255,51,51)', 'rgb(51,154,255)', "rgb(255,174,60)"],
						borderWidth: 1
					}]
				},
				options: {
					title: {
						display: true,
						text: '전일 통계',
						fontSize: 18
					},
					legend: {
						display: true,
						position: 'top',
					},
					tooltips: {
						callbacks: {
							label: function(tooltipItem, data) {
								var label = labels[tooltipItem.index];
								var dataset = data.datasets[tooltipItem.datasetIndex];
								var currentValue = dataset.data[tooltipItem.index];
								return label + ": " + currentValue + "개"; // "항목: 갯수 개 (비율%)" 형태로 표시
							}
						}
					}
				}
			});
		},
		error: function(xhr, status, error) {
			console.error('차트3 HTTP 상태 코드: ' + xhr.status);
			console.error('차트3 상태 텍스트: ' + xhr.statusText);
			console.error('차트3 발생한 예외: ' + error);
		}
	});


	// 라인차트
	$.ajax({
		url: 'lineChart',
		method: 'GET',
		success: function(response) {
			// 데이터 받아오기
			var data = response;

			// 차트 그리기
			var lineChartCtx = document.getElementById('myChart2').getContext('2d');
			var maxData = Math.max(...data.good.concat(data.bad, data.turtle));
			var yMax = maxData > 0 ? Math.ceil(maxData / 10) * 10 + 10 : 10;


			var lineChart = new Chart(lineChartCtx, {
				type: 'line',
				data: {
					labels: data.labels,
					datasets: [{
						label: '좋은 자세',
						data: data.good,
						backgroundColor: 'rgb(0,200,0)',
						borderColor: 'rgb(0,200,0)',
						borderWidth: 1,
						fill: false,
						tension: 0.1
					},
					{
						label: '나쁜 자세',
						data: data.bad,
						backgroundColor: 'rgb(255,51,51)',
						borderColor: 'rgb(255,51,51)',
						borderWidth: 1,
						fill: false,
						tension: 0.1
					},
					{
						label: '거북목 ',
						data: data.turtle,
						backgroundColor: 'rgb(51,154,255)',
						borderColor: 'rgb(51,154,255)',
						borderWidth: 1,
						fill: false,
						tension: 0.1
					}
					]
				},
				options: {
					title: {
						display: true,
						text: '주간 통계',
						fontSize: 18
					},
					scales: {
						xAxes: [{
							scaleLabel: {
								display: true,
								labelString: '요일',
							}
						}],
						yAxes: [{
							scaleLabel: {
								display: true,
								labelString: '횟수',
							},
							ticks: {
								beginAtZero: true,
								min: 0,
								max: yMax
							}
						}]
					},
					animation: {
						duration: 3000, // 애니메이션 지속 시간 설정
						onComplete: function() {
							var chartInstance = this.chart,
								ctx = chartInstance.ctx;
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';
						}
					}
				}
			});
		},
		error: function(xhr, status, error) {
			// 에러 처리
			console.error('차트4 HTTP 상태 코드: ' + xhr.status);
			console.error('차트4 상태 텍스트: ' + xhr.statusText);
			console.error('차트4 발생한 예외: ' + error);
		}
	});



	// 피드백ㅇ
	$.ajax({
		url: 'feed',
		method: 'GET',
		success: function(response) {

			// 데이터를 HTML에 삽입
			var feedbId = $("#fdId")
			var feedbTxt = $("#fdTxt")
			var feedbG = $("#fdG")
			var feedbB = $("#fdB")
			if (response.feedback) {
				// 피드백 데이터가 있는 경우
				feedbId.text(response.feedId + "님의 통계");
				feedbTxt.text(response.feedback);
				feedbG.text("1일전 좋은자세는 " + response.oneGoodCount + "개 입니다");
				feedbG.append(document.createElement('br'));
				feedbG.append("2일전 좋은자세는 " + response.twoGoodCount + "개 입니다");
				feedbB.text("1일전 나쁜자세는 " + response.oneBadCount + "개 입니다");
				feedbB.append(document.createElement('br'));
				feedbB.append("2일전 나쁜자세는 " + response.twoBadCount + "개 입니다");

			} else {
				feedbId.html('<p style="font-size: 12px;"> ' + response.feedId + "님의 피드백" + '</p>');
				feedbTxt.html('<p style="font-size: 12px;"> ' + response.feedId + "님의 피드백" + '</p>');
				feedbG.html('<p style="font-size: 12px;"> ' + response.feedId + "님의 피드백" + '</p>');
				feedbB.html('<p style="font-size: 12px;"> ' + response.feedId + "님의 피드백" + '</p>');
			}

			/* Good와 Bad 카운트를 표시
			if (!response.feedback.includes("님 1일전 데이터 없음") && !response.feedback.includes("님 2일전 데이터 없음")) {
				var feedbackHtml = '<p style="font-size: 12px;">1일전 좋아용 : ' + response.oneGoodCount + ' / 1일전 나빠용: ' + response.oneBadCount + '</p>';
				feedbackHtml += '<p style="font-size: 12px;">2일전 나빠용 : ' + response.twoBadCount + ' / 2일전 나빠용: ' + response.twoGoodCount + '</p>';
				feedbDiv.append(feedbackHtml);
			}else{
				var feedbackHtml = '<p style="font-size: 12px;">데이터가 없어용 </p>';
				feedbDiv.append(feedbackHtml);
			}
			*/
		},
		error: function(xhr, status, error) {
			console.error('차트5 : ' + xhr.status);
			console.error('차트5 : ' + xhr.statusText);
			console.error('차트5 : ' + error);
		}
	});

})