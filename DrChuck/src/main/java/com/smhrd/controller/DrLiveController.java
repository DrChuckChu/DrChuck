package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.smhrd.entity.DrMember;
import com.smhrd.repository.DrLiveRepository;

@Controller
public class DrLiveController {

   @Autowired
   private DrLiveRepository drLiveRepository;

   @PostMapping("/openWebcam")
     public ResponseEntity<String> startWebcam(Model model, HttpSession session) {
      
       DrMember user = (DrMember) session.getAttribute("user");
        String userId = user.getDmId();
        String userSex = user.getDmSex();
        

      if (userId == null) {
         return new ResponseEntity<String>("dmId null입니다.", HttpStatus.BAD_REQUEST);
      }else if (userSex ==null){
         return new ResponseEntity<String>("dmSex null입니다.", HttpStatus.BAD_REQUEST);
      }

      // POST 방식으로 플라스크 애플리케이션으로 웹캠을 열도록 요청을 보냅니다.
      RestTemplate restTemplate = new RestTemplate();
      String flaskAppUrl = "http://172.30.1.55:5000/openWebcam"; // 플라스크 애플리케이션의 웹캠 열기 엔드포인트 URL
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_JSON);

      // 요청 본문 데이터, 필요에 따라 JSON 형식으로 데이터를 만들어 보낼 수 있습니다.
      String requestBody = String.format("{\"회원아이디\": \"%s\", \"성별\": \"%s\"}", userId, userSex);

      HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

      String response = restTemplate.postForObject(flaskAppUrl, entity, String.class);

      return new ResponseEntity<String>(response, HttpStatus.OK);
   }

   @PostMapping("/closeWebcam")
   public ResponseEntity<String> stopWebcam(Model model, HttpSession session) {
	   
	   DrMember user = (DrMember) session.getAttribute("user");
       String userId = user.getDmId();
       String userSex = user.getDmSex();
       
      // POST 방식으로 플라스크 애플리케이션으로 웹캠을 닫도록 요청을 보냅니다.
      RestTemplate restTemplate = new RestTemplate();
      String flaskAppUrl = "http://172.30.1.55:5000/stopWebcam"; // 플라스크 애플리케이션의 웹캠 닫기 엔드포인트 URL

      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_JSON);

      // 요청 본문 데이터, 필요에 따라 JSON 형식으로 데이터를 만들어 보낼 수 있습니다.

      HttpEntity<String> entity = new HttpEntity<>(headers);

      String response = restTemplate.postForObject(flaskAppUrl, entity, String.class);

      return new ResponseEntity<String>(response, HttpStatus.OK);
   }
}