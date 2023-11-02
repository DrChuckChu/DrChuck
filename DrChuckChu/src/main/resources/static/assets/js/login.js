function checkUsername() {
  var username = document.getElementById("username").value;

  // 서버에 요청을 보내는 부분은 백엔드 구현에 따라 달라집니다.
  // 아래는 예시로 작성한 코드이며 실제 구현에서는 AJAX, fetch, axios 등을 사용할 수 있습니다.
  fetch('/check-username/' + username)
    .then(response => response.json())
    .then(data => {
      var message = document.getElementById("message");
      if (data.isDuplicate) {
        message.textContent = "이미 사용 중인 아이디입니다.";
      } else {
        message.textContent = "사용 가능한 아이디입니다.";
      }
    });
}
