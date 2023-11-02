package com.smhrd.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.smhrd.entity.DrLive;
import com.smhrd.entity.DrMember;
import com.smhrd.repository.DrLiveRepository;

@Controller
public class AlarmController {

   @Autowired
   private DrLiveRepository drLiveRepository;

   @RequestMapping("/getLatestPosture")
   public ResponseEntity<?> getLatestPosture(HttpSession session) {
       // 최신의 자세 정보 가져오기
       DrMember user = (DrMember) session.getAttribute("user");
       String userId = user.getDmId();
       DrLive dl = drLiveRepository.findTopByDlIdAndDlResultInOrderByDlDateDesc(userId, Arrays.asList("Good", "Bad", "Turtle"));
       if (dl != null) {
           Map<String, Object> response = new HashMap<>();
           response.put("userId", userId);
           response.put("posture", dl.getDl_result());
           
           return ResponseEntity.ok(response);
       } else {
           return ResponseEntity.status(404).body("자세 정보가 없습니다.");
       }
   }
   
   
}
