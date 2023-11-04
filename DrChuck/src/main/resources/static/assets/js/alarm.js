let timeLeft1 = 30; // 스트레칭 알람 타이머 (30초)
let timeLeft2 = 10;  // 자세 알람 타이머 (10초)

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

// timer1 및 timer2 요소에 대한 참조
const timerElement1 = document.getElementById('timer1');
const timerElement2 = document.getElementById('timer2');

function poseAndLiveNotify() {
    if (timeLeft1 > 0 && alarmStatus) {
        timeLeft1--;
        timerElement1.innerText = timeLeft1;
    } else if (alarmStatus) {
        // 스트레칭 알람 코드
        $.ajax({
            // 기존 코드 유지...
        });

        timeLeft1 = 30;
    } 

    if (timeLeft2 > 0 && alarmStatus) { // 스트레칭 알람과 상관없이 자세 알람이 작동하도록 합니다.
        timeLeft2--;
        timerElement2.innerText = timeLeft2;
    } else if (alarmStatus) {
        // 자세 알람 코드
        $.ajax({
            // 기존 코드 유지...
        });

        timeLeft2 = 10; // 자세 알람이 울릴 때에만 timeLeft2를 리셋합니다.
    }
}

window.addEventListener('load', () => {
	setInterval(poseAndLiveNotify, 1000);
});

// 알람 버튼 클릭 이벤트 핸들러
document.querySelector('.alarm').addEventListener('click', function() {
	alarmStatus = !alarmStatus;
	if (alarmStatus) {
		this.children[0].src = 'images/알림온.png';
		timeLeft2 = 10; // 알람을 켤 때마다 timeLeft2를 10으로 재설정
	} else {
		this.children[0].src = 'images/알람오프.png';
	}
});