let timeLeft1 = 30; // 스트레칭 알람 타이머 (30초)
let timeLeft2 = 35;  // 자세 알람 타이머 (50초)

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
            url: `/dr/getLatestPosture`,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                const randomIndex = Math.floor(Math.random() * youtubeLinks.length);
                const randomLink = youtubeLinks[randomIndex];
                const notification = new Notification(`현재 사용자: ${data.userId}`, { body: `스트레칭 영상 클릭` });
                
                notification.onclick = function() {
                    window.open(randomLink);
                    notification.close();
                };

                setTimeout(() => {
                    notification.close();
                }, 10000);
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });

        timeLeft1 = 30;
    } 

    if (timeLeft2 > 0 && alarmStatus) { // 스트레칭 알람과 상관없이 자세 알람이 작동하도록 합니다.
        timeLeft2--;
        timerElement2.innerText = timeLeft2;
    } else if (alarmStatus) {
        // 자세 알람 코드
          $.ajax({
            url: `/dr/getLatestPosture`,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
            if(data.posture == "Emp"){
                const notification = new Notification(`현재 사용자: ${data.userId} `, { body: `${data.userId} 님이 현재 자리에 없습니다. 돌아오시는대로 자세를 체크하도록 하겠습니다.` });
                console.log(`${data.dl_result}`)
                setTimeout(() => {
                    notification.close();
                }, 5000);
                
            }else if(data.posture == "Bad"){
               const notification = new Notification(`현재 사용자: ${data.userId} `, { body: `현재 자세가 좋지 않습니다. 앉는 자세를 조금 더 신경 써 주세요.` });
                console.log(`${data.dl_result}`)
                setTimeout(() => {
                    notification.close();
                }, 5000);
            }else if(data.posture == "Good") {
            const notification = new Notification(`현재 사용자: ${data.userId} `, { body: `현재 자세가 훌륭합니다. 좋은 자세를 유지하는 것이 중요해요.` });
                console.log(`${data.dl_result}`)
                setTimeout(() => {
                    notification.close();
                }, 5000);
                
                }else if(data.posture == "Turtle") {
                
            const notification = new Notification(`현재 사용자: ${data.userId} `, { body: `현재 자세는 거북목을 유발합니다. 머리를 뒤로 당겨서 정상 자세를 유지해 주세요.` });
                console.log(`${data.dl_result}`)
                setTimeout(() => {
                    notification.close();
                }, 5000);
                
            }else{
            
            const notification = new Notification(`현재 사용자: ${data.userId} `, { body: `현재 자세에 대한 데이터가 없습니다` });
                console.log(`${data.dl_result}`)
                setTimeout(() => {
                    notification.close();
                }, 5000);   
            }
            
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });

        timeLeft2 = 35; // 자세 알람이 울릴 때에만 timeLeft2를 50으로 리셋합니다.
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
      timeLeft2 = 35; // 알람을 켤 때마다 timeLeft2를 50으로 재설정
   } else {
      this.children[0].src = 'images/알람오프.png';
   }
});
