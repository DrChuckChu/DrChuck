package com.smhrd.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.smhrd.entity.DrMember;
import com.smhrd.repository.DrLiveRepository;

@RestController
public class ChartController {

    @Autowired
    private DrLiveRepository drLiveRepository;

    
    // 오전/오후/저녁 bar 차트
    @GetMapping("/myChart")
    public ResponseEntity<?> getMyChartData(HttpSession session) {
    	 DrMember user = (DrMember) session.getAttribute("user");
    	 String userId = user.getDmId();
    	
        // 아침, 오후, 저녁 시간대를 정의합니다.
    	String morningStartHour = "06:00:00";
    	String morningEndHour = "12:00:00";
    	String afternoonStartHour = "12:00:01";
    	String afternoonEndHour = "18:00:00";
    	String eveningStartHour = "18:00:01";
    	String eveningEndHour = "23:59:59";

        // 각 시간대별로 좋은 자세와 나쁜 자세의 데이터를 가져옵니다.
    	int morningGood = drLiveRepository.findMorningGoodPostureData(morningStartHour, morningEndHour, userId);
    	int morningBad = drLiveRepository.findMorningBadPostureData(morningStartHour, morningEndHour, userId);
    	int afternoonGood = drLiveRepository.findAfternoonGoodPostureData(afternoonStartHour, afternoonEndHour, userId);
    	int afternoonBad = drLiveRepository.findAfternoonBadPostureData(afternoonStartHour, afternoonEndHour, userId);
    	int eveningGood = drLiveRepository.findEveningGoodPostureData(eveningStartHour, eveningEndHour, userId);
    	int eveningBad = drLiveRepository.findEveningBadPostureData(eveningStartHour, eveningEndHour, userId);
    	int morningTurtle= drLiveRepository.findMorningTurtlePostureData(morningStartHour, morningEndHour, userId);
    	int afternoonTurtle = drLiveRepository.findAfternoonTurtlePostureData(afternoonStartHour, afternoonEndHour, userId);
    	int eveningTurtle = drLiveRepository.findEveningTurtlePostureData(eveningStartHour, eveningEndHour, userId);
    	// 응답 데이터를 만듭니다.
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("labels", Arrays.asList("아침(06:00 ~ 12:00)", "점심(12:00 ~ 18:00)", "저녁(18:00 ~ 24:00)"));
        responseData.put("good", Arrays.asList(morningGood, afternoonGood, eveningGood));
        responseData.put("bad", Arrays.asList(morningBad, afternoonBad, eveningBad));
        responseData.put("turtle", Arrays.asList(morningTurtle, afternoonTurtle, eveningTurtle));
    	System.out.println("차트1번 바 차트 간다리");
        return ResponseEntity.ok(responseData);
    }
    
    // 일일 누적 차트
    @GetMapping("/pieChart")
    public ResponseEntity<?> getPieData(HttpSession session) {
    	 DrMember user = (DrMember) session.getAttribute("user");
    	 String userId = user.getDmId();
        // 하루치 시간 정의
    	String StartHour = "00:00:00";
    	String EndHour = "23:59:59";
        // 각 시간대별로 좋은 자세와 나쁜 자세의 데이터를 가져옵니다.
    	int Good = drLiveRepository.findGoodData(StartHour, EndHour, userId);
    	int Bad = drLiveRepository.findBadData(StartHour, EndHour, userId);
    	int Turtle = drLiveRepository.findTurtleData(StartHour, EndHour, userId);
        // 응답 데이터를 만듭니다.
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("labels", Arrays.asList("좋은자세", "나쁜자세"));
        responseData.put("good", Good);
        responseData.put("bad", Bad);
        responseData.put("turtle", Turtle);
        System.out.println("차트2번 간다리");
        return ResponseEntity.ok(responseData);
    }
    
    // 예외처리 도넛차트
    @GetMapping("/donutChart")
    public ResponseEntity<?> getDonutData(HttpSession session) {
    	DrMember user = (DrMember) session.getAttribute("user");
        String userId = user.getDmId();
        LocalDate currentDate = LocalDate.now().minusDays(1);
        // 응답 데이터를 만듭니다.
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("labels", Arrays.asList("좋은 자세","나쁜 자세","거북목", "자리비움"));
        List<Integer> data = new ArrayList<>();
        // 각 필드별로 데이터를 가져옵니다.
        try {
            data.add(drLiveRepository.findGoodPostureDataByDateAndDlrId(userId));
        } catch (Exception e) {
            data.add(0);
        }
        try {
            data.add(drLiveRepository.findBadPostureDataByDateAndDlrId(userId));
        } catch (Exception e) {
            data.add(0);
        }
        try {
            data.add(drLiveRepository.findTurtlePostureDataByDateAndDlrId(userId));
        } catch (Exception e) {
            data.add(0);
        }
        try {
            data.add(drLiveRepository.findEmpPostureDataByDateAndDlrId(userId));
        } catch (Exception e) {
            data.add(0);
        }
        responseData.put("data", Arrays.asList(data.toArray()));
        System.out.println("차트3번 간다리!");
        return ResponseEntity.ok(responseData);
    }
    
    // 요일별 라인차트
    @GetMapping("/lineChart")
    public ResponseEntity<?> getLineData(HttpSession session) {
    	DrMember user = (DrMember) session.getAttribute("user");
        String userId = user.getDmId();
        // 요일 정의
        List<String> dayNames = Arrays.asList("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
        List<Integer> goodData = new ArrayList<>();
        List<Integer> badData = new ArrayList<>();
        List<Integer> turtleData = new ArrayList<>();
        // 각 요일별로 좋은 자세와 나쁜 자세의 데이터를 가져옵니다.
        for(String dayName : dayNames) {
        	 try {
                 goodData.add(drLiveRepository.findGoodPostureDataByDay(dayName, userId));
        	 } catch (Exception e) {
        		 goodData.add(0);
             }
        	 try {
        		 badData.add(drLiveRepository.findBadPostureDataByDay(dayName, userId));
        	 } catch (Exception e) {
        		 badData.add(0);
             }
        	 try {
        		 turtleData.add(drLiveRepository.findTurtlePostureDataByDay(dayName, userId));
        	 } catch (Exception e) {
        		 turtleData.add(0);
             }
        }
        // 응답 데이터를 만듭니다.
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("labels", Arrays.asList("일", "월", "화", "수", "목", "금", "토"));
        responseData.put("good", Arrays.asList(goodData.toArray()));
        responseData.put("bad", Arrays.asList(badData.toArray()));
        responseData.put("turtle", Arrays.asList(turtleData.toArray()));
        System.out.println("차트4번 간다리");
        return ResponseEntity.ok(responseData);
    }
    
    // 차트 피드백(심심풀이용)
    @GetMapping("/feed")
    public ResponseEntity<?> getChartFe(HttpSession session) {
        DrMember user = (DrMember) session.getAttribute("user");
        String userId = user.getDmId();
        LocalDate currentDate = LocalDate.now().minusDays(1);

        // 응답 데이터를 만듭니다.
        Map<String, Object> responseData = new HashMap<>();
        List<Integer> data = new ArrayList<>();

        // 각 필드별로 데이터를 가져옵니다.
        int OneGood = drLiveRepository.findOneGood(userId).orElse(0);
        int OneBad = drLiveRepository.findOneBad(userId).orElse(0);
        int TwoGood = drLiveRepository.findTwoGood(userId).orElse(0);
        int TwoBad = drLiveRepository.findTwoBad(userId).orElse(0);
        
        if (OneGood == 0 || OneBad == 0 ) {
        	responseData.put("feedback", userId + "님의 금일 데이터 없음");
        }
        
        if (OneGood > OneBad) {
        	if (TwoGood > TwoBad) {
                responseData.put("feedback", "2일 연속 좋은 자세를 많이하고 있습니다"); // 좋아용을 데이터로 추가
            } else if (TwoGood < TwoBad) {
                responseData.put("feedback", "2일전과 다르게 어제는 좋은자세를 많이 했습니다"); // 나빠용을 데이터로 추가
            }
        } else if (OneGood < OneBad) {
        	if (TwoGood > TwoBad) {
                responseData.put("feedback", "어제는 2일전에 비해 자세가 나쁜자세를 많이 했습니다"); // 좋아용을 데이터로 추가
            } else if (TwoGood < TwoBad) {
                responseData.put("feedback",  "2일연속 나쁜 자세를 많이하고 있습니다."); // 나빠용을 데이터로 추가
            }
        } else {
        	if (TwoGood != 0 || TwoBad != 0 && TwoGood == TwoBad) {
                responseData.put("feedback", "2일 연속 바른자세, 나쁜자세가 같습니다"); // 좋아용을 데이터로 추가
            } 
        }

        responseData.put("feedId", userId); // Good 값을 데이터로 추가
        responseData.put("oneGoodCount", OneGood); // Good 값을 데이터로 추가
        responseData.put("oneBadCount", OneBad);   // Bad 값을 데이터로 추가
        responseData.put("twoBadCount", TwoGood);   // Bad 값을 데이터로 추가
        responseData.put("twoGoodCount", TwoBad);   // Bad 값을 데이터로 추가
		
        System.out.println(responseData+"뭐들어감?");
        System.out.println("피드백 간다리!");

        return ResponseEntity.ok(responseData);
    }
    
    
}