// 시간 카운트 다운을 위한 변수
let timeLeft1 = 5;
let timeLeft2 = 5;

// 시간을 표시하는 요소
const timerElement1 = document.getElementById('timer1');
const timerElement2 = document.getElementById('timer2');

// 알람 on/off 상태 저장 변수 (기본값은 false)
let alarmStatus = false;

// 랜덤한 YouTube 링크 배열
const youtubeLinks = [
	"https://www.youtube.com/watch?v=XdFhIyu_7Vw&pp=ygURNeu2hCDsiqTtirjroIjsua0%3D",
	"https://www.youtube.com/watch?v=S_XjbPjWL3o&pp=ygURNeu2hCDsiqTtirjroIjsua0%3D",
	"https://www.youtube.com/watch?v=uXYvcU1lmGI&pp=ygURNeu2hCDsiqTtirjroIjsua0%3D",
	"https://www.youtube.com/watch?v=MTU4iCDntjs&pp=ygUb7IKs66y07KeBIDXrtoQg7Iqk7Yq466CI7Lmt",
	"https://www.youtube.com/watch?v=dJXZRZvqbYg&pp=ygUW6rGw67aB66qpIOyKpO2KuOugiOy5rQ%3D%3D"
];

function poseAndLiveNotify() {
    if (timeLeft1 > 0 && alarmStatus) {
        timeLeft1--;
        timerElement1.innerText = timeLeft1;
    } else if (alarmStatus) {
        $.ajax({
            url: `/dr/getLatestPosture`,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                const randomIndex = Math.floor(Math.random() * youtubeLinks.length);
                const randomLink = youtubeLinks[randomIndex];
                const notification = new Notification(`현재 사용자: ${data.userId}`, { body: `스트레칭해야해요. 링크: ${randomLink}` });
                
                notification.onclick = function() {
                    window.open(randomLink);
                    notification.close();
                };

                setTimeout(() => {
                    notification.close();
                }, 3000);
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });

        timeLeft1 = 5;

        setTimeout(() => {
            notification.close();
        }, 3000);
    }

    if (timeLeft2 > 0 && alarmStatus) {
        timeLeft2--;
        timerElement2.innerText = timeLeft2;
    } else if (alarmStatus) {
        // 서버에 최신 자세 요청
        $.ajax({
            url: `/dr/getLatestPosture`,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                const notification = new Notification(`현재 사용자: ${data.userId}`, { body: `현재 자세: ${data.posture}` });
                console.log(`${data.dl_result}`)
                setTimeout(() => {
                    notification.close();
                }, 3000);
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });

        timeLeft2 = 5;
    }
}

window.addEventListener('load', () => {
    setInterval(poseAndLiveNotify, 1000);
    setInterval(poseAndLiveNotify, 1000);
});

// 알람 버튼 클릭 이벤트 핸들러는 그대로 사용하면 됩니다.
document.querySelector('.alarm').addEventListener('click', function() {
    alarmStatus = !alarmStatus; 
    this.children[0].src = alarmStatus ? 'images/알람이미지최종.png' : 'images/알람끔.png';
});
