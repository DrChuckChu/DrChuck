<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>CodePen - Log In / Sign Up - pure css - #12</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'><link rel="stylesheet" href="assets/css/style.css">

</head>
<body>
<!-- partial:index.partial.html -->


   <div class="section">
      <div class="container">
         
         <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
               <div class="logoImg">
                  <a href="goLogin" class="logo">
                        <img src="images/logo.png" alt="로고 이미지 준비 중">
                     </a>
                  </div>
               <div class="section pb-5 pt-5 pt-sm-2 text-center">
                  <h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
                      <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                      <label for="reg-log"></label>
                  <div class="card-3d-wrap mx-auto">
                     <div class="card-3d-wrapper">
                        <div class="card-front">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4 pb-3">Log In</h4>
                                 <div class="form-group">
                                 
				<form id = "login" action="login" method="post">
                                    <input type="text" name="dmId" class="form-style" placeholder="Your ID" id="logeID" autocomplete="off">
                                    <i class="input-icon uil uil-user"></i>
                                 </div>   
                                 <div class="form-group mt-2">
                                    <input type="password" name="dmPw" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
                                    <i class="input-icon uil uil-lock-alt"></i>
                                 </div>
                                 <input type="submit" class="btn mt-4" value="submit">
				</form>
                                        <p class="mb-0 mt-4 text-center"><a href="goFind" class="link">아이디 찾기</a></p>
                                 </div>
                              </div>
                           </div>
                        <div class="card-back">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4 pb-3">Sign Up</h4>
                                 <div class="form-group">
			<form id = "join" action="join" method="post">
                                    <input type="text" name="dmName" class="form-style" placeholder="이름을 입력해주세요." id="logname" autocomplete="off">
                                    <i class="input-icon uil uil-user"></i>
                                 </div>   
                                 
                                 <div class="form-group mt-2">
                                    <input type="text" name="dmId" class="form-style" placeholder="ID를 입력해주세요" id="logpass" autocomplete="off">
                                    <i class="input-icon uil uil-user"></i>
                                 </div>
                                 <div class="form-group mt-2">
                                    <input type="email" name="dmEmail" class="form-style" placeholder="EMAIL을 입력해주세요" id="logemail" autocomplete="off">
                                    <i class="input-icon uil uil-at"></i>
                                 </div>
                                 <div class="form-group mt-2">
                                    <input type="password" name="dmPw" class="form-style" placeholder="PASSWORD를 입력해주세요" id="logpass" autocomplete="off">
                                    <i class="input-icon uil uil-lock-alt"></i>
                                 </div>
                                 <div class="form-group mt-2">
                                    <input type="number" name="dmKey" class="form-style" placeholder="신장을 입력해주세요(cm)" id="logpass" autocomplete="off">
                                    <i class="input-icon uil uil-user"></i>
                                 </div>
                                 <div class="form-group mt-2">
                                    <input type="number" name="dmMuge" class="form-style" placeholder="체중을 입력해주세요(kg)" id="logpass" autocomplete="off">
                                    <i class="input-icon uil uil-user"></i>
                                 </div>
                                 <div class="form-group mt-2">
												
												<select name="dmSex" class="form-style" placeholder="성별" autocomplete="off">
												  <option value="" selected disabled>성별</option>
												  <option value="M">남성</option>
												  <option value="F">여성</option>
												</select>
												<i class="input-icon uil uil-user"></i>
											  </div>
											<div class="form-group mt-2">
												
												<select name="dmJob" class="form-style" placeholder="직업(직종)" autocomplete="off">
												  <option value="" selected disabled>직장(직종)</option>
												  <option value="사무직">사무직</option>
												  <option value="학생">학생</option>
												  <option value="기타">기타</option>
												</select>
												<i class="input-icon uil uil-user"></i>
											  </div>
                                  <input type="submit" class="btn mt-4" value="submit">
									</form>	
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
  <script  src="./script.js"></script>
<footer class="footer">
</footer>

</body>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/script.js"></script>
			<script src="assets/js/login.js"></script>

</html>