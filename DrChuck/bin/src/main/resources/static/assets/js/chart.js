var generateData = function() {
    var labels = [];
    var good = [];
    var bad = [];
 
    for (var i = 0; i < 7; i++) {
       labels.push('Label ' + (i + 1));
       good.push(Math.floor(Math.random() * 50) + 10);
       bad.push(Math.floor(Math.random() * 50) + 10);
    }
 
    return {
       labels: labels,
       good: good,
       bad: bad
    };
 };
 
 $(document).ready(function() {
    // 바 차트
    var data = generateData();
    var myChartCtx = document.getElementById('chart').getContext('2d');
    var myChart = new Chart(myChartCtx, {
       type: 'bar',
       data: {
          labels: data.labels,
          datasets: [{
             label: '좋은 자세',
             data: data.good,
             backgroundColor: "#66DE47",
             borderColor: 'rgba(75, 192, 192, 1)',
             borderWidth: 1
          }, {
             label: '나쁜 자세',
             data: data.bad,
             backgroundColor: "#F53B3B",
             borderColor: 'rgba(255, 99, 132, 1)',
             borderWidth: 1
          }]
       },
       options: {
          title: {
             display: true,
             text: '실시간 일일 바 차트'
          },
          scales: {
             yAxes: [{
                ticks: {
                   beginAtZero: true
                }
             }]
          }
       }
    });
 
    // 다른 차트들도 위와 비슷한 방식으로 데이터를 생성하고 차트를 그리면 됩니다.
 });

 // 파이 차트
var pieData = {
    labels: ['좋은 자세', '나쁜 자세'],
    datasets: [{
        data: [Math.random(), Math.random()],
        backgroundColor: ['#66DE47', '#F53B3B'],
        borderColor: ['green', 'red'],
        borderWidth: 1
    }]
};

var pieChartCtx = document.getElementById('pieExample').getContext('2d');
var pieChart = new Chart(pieChartCtx, {
    type: 'pie',
    data: pieData,
    options: {
        title: {
            display: true,
            text: '일일 누적 파이차트'
        }
    }
});

// 라인 차트
var lineData = generateData();
var lineChartCtx = document.getElementById('myChart2').getContext('2d');
var lineChart = new Chart(lineChartCtx, {
    type: 'line',
    data: {
        labels: lineData.labels,
        datasets: [{
            label: '좋은 자세',
            data: lineData.good,
            backgroundColor: '#66DE47',
            borderColor: 'green',
            borderWidth: 1,
            fill: false,
            tension: 0.1
        },
        {
            label: '나쁜 자세',
            data: lineData.bad,
            backgroundColor: '#F53B3B',
            borderColor: 'red',
            borderWidth: 1,
            fill: false,
            tension: 0.1
        }]
    },
    options: {
        title: {
            display: true,
            text: '지난주 요약 주간 선형 차트'
        },
        scales: {
            yAxes: [{
                stacked: true,
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

// 도넛 차트
var donutData = {
    labels: ['좋은 자세', '나쁜 자세', '중립'],
    datasets: [{
        data: [Math.random(), Math.random(), Math.random()],
        backgroundColor: ['#66DE47', '#F53B3B', '#FFD700'],
        borderColor: ['green', 'red', 'yellow'],
        borderWidth: 1
    }]
};

var donutChartCtx = document.getElementById('pie-chart').getContext('2d');
var donutChart = new Chart(donutChartCtx, {
    type: 'doughnut',
    data: donutData,
    options: {
        title: {
            display: true,
            text: '어제 예외처리 도넛 차트'
        }
    }
});
