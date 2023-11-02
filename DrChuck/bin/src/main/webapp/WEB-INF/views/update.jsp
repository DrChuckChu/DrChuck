<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Log In / Sign Up - pure css - #12</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
  <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
  <link rel="stylesheet" href="update.css">
</head>
<body>
<!-- partial:index.partial.html -->
   <div class="section">
      <div class="container">
         <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
               <div class="logoImg">
                  <a href="./startPage.html" class="logo" target="_blank">
                     <img src="/메인및로그인회원가입/img/최종_로고-배경제거.png" alt="로고 이미지 준비 중">
                  </a>
               </div>
               <div class="section pb-5 pt-5 pt-sm-2 text-center">
                  <div class="card-3d-wrap mx-auto">
                     <div class="card-3d-wrapper">
                        <div class="card-front">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4 pb-3">개인정보 수정</h4>
                                 <form>
                                    <div class="form-group">
                                       <input type="email" name="logemail" class="form-style" placeholder="이메일을 입력해주세요" id="logemail" autocomplete="off" required>
                                       <i class="input-icon uil uil-at"></i>
                                       <span class="required">*</span>
                                    </div>   
                                    <div class="form-group mt-2">
                                       <input type="password" name="logpass" class="form-style" placeholder="비밀번호를 입력해주세요" id="logpass" autocomplete="off" required>
                                       <i class="input-icon uil uil-lock-alt"></i>
                                       <span class="required">*</span>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="number" name="logheight" class="form-style" placeholder="신장을 입력해주세요(cm)" id="logheight" autocomplete="off" required>
                                       <i class="input-icon uil uil-user"></i>
                                       <span class="required">*</span>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="number" name="logweight" class="form-style" placeholder="체중을 입력해주세요(kg)" id="logweight" autocomplete="off" required>
                                       <i class="input-icon uil uil-user"></i>
                                       <span class="required">*</span>
                                    </div>
                                    <div class="form-group mt-2">                                    
                                       <select name="logjob" class="form-style" placeholder="직장(직종)" autocomplete="off" required>
                                         <option value="" selected disabled>직장(직종)</option>
                                         <option value="option1">사무직</option>
                                         <option value="option2">학생</option>
                                         <option value="option3">기타</option>
                                       </select>
                                       <i class="input-icon uil uil-user"></i>
                                    </div>
                                    <button type="submit" class="btn mt-4">수정하기</button>
                                    <button type="reset" class="btn mt-4">다시 작성</button>
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
</html>