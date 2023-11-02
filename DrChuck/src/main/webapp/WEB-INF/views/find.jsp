<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>CodePen - Log In / Sign Up - pure css - #12</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
    <link rel="stylesheet" href="find.css">

</head>

<body>
    <!-- partial:index.partial.html -->


    <div class="section">
        <div class="container">

            <div class="row full-height justify-content-center">
                <div class="col-12 text-center align-self-center py-5">
                    <div class="logoImg">
                        <a href="./startPage.html" class="logo" target="_blank">
                            <img src="images/최종_로고-배경제거.png" alt="로고 이미지 준비 중">
                        </a>
                    </div>
                    <div class="section pb-5 pt-5 pt-sm-2 text-center">
                        <h6 class="mb-0 pb-3"><span>FIND ID </span><span>FIND PW</span></h6>
                        <input class="checkbox" type="checkbox" id="reg-log" name="reg-log" />
                        <label for="reg-log"></label>
                        <div class="card-3d-wrap mx-auto">
                            <div class="card-3d-wrapper">
                                <div class="card-front">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">FIND ID</h4>
                                            <div class="form-group">
                                                <input type="email" name="logeID" class="form-style"
                                                    placeholder="EMAIL을 입력해주세요." id="logemail" autocomplete="off">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" name="logpass" class="form-style"
                                                    placeholder="이름을 입력해주세요." id="logname" autocomplete="off">
                                                <i class="input-icon uil uil-user"></i>
                                            </div>
                                            <a href="#" class="btn mt-4">FIND</a>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                            <h4 class="mb-4 pb-3">FIND PW</h4>
                                            
                                            <div class="form-group mt-2">
                                                <input type="num" name="logid" class="form-style"
                                                    placeholder="ID를 입력해주세요" id="logpass" autocomplete="off">
                                                <i class="input-icon uil uil-user"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="email" name="logemail" class="form-style"
                                                    placeholder="EMAIL을 입력해주세요" id="logemail" autocomplete="off">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>
                                            
                                            
                                            
                                            <a href="#" class="btn mt-4">FIND</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- partial -->
    <script src="./script.js"></script>

    <footer class="footer">

    </footer>


</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function () {
        // ID 찾기 양식 제출
     $("#findId").submit(function (e) {
    e.preventDefault(); // 폼 제출의 기본 동작을 중지
    $.post("/t/findId", $(this).serialize(), function (data) {
        if (data) {
            Swal.fire({
                icon: 'success',
                title: '아이디 찾기 결과',
                text: data
            }).then(function() {
                window.location.href = '/t/goLogin'; // 로그인 페이지로 이동
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: '에러',
                text: '해당하는 아이디를 찾을 수 없습니다.'
            });
        }
    });
});

     // 비밀번호 찾기 양식 제출
     $("#findPw").submit(function (e) {
         e.preventDefault(); // 폼 제출의 기본 동작을 중지
         $.post("/t/findPw", $(this).serialize(), function (data) {
             if (data) {
             	Swal.fire({
                     icon: 'success',
                     title: '비밀번호 찾기 결과',
                     text: data
                 }).then(function(){
             	window.location.href = '/t/goLogin'
             	});
             } else {
             	Swal.fire({
                     icon: 'error',
                     title: '에러',
                     text: '해당하는 비밀번호를 찾을 수 없습니다.'
                 });
             }
         });
     });
 });
</script>
</html>
