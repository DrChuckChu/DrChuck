package com.smhrd.repository;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.DrLive;

   public interface DrLiveRepository extends JpaRepository<DrLive, Long> {

      // 아침점심저녁 좋은자세 나쁜자세 1 좋음 2 나븜
      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Good' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :morningStartHour AND TIME(d.dl_date) <= :morningEndHour AND d.dl_id = :dl_id")
      int findMorningGoodPostureData(@Param("morningStartHour") String morningStartHour, @Param("morningEndHour") String morningEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Good' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :afternoonStartHour AND TIME(d.dl_date) <= :afternoonEndHour AND d.dl_id = :dl_id")
      int findAfternoonGoodPostureData(@Param("afternoonStartHour") String afternoonStartHour, @Param("afternoonEndHour") String afternoonEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Good' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :eveningStartHour AND TIME(d.dl_date) <= :eveningEndHour AND d.dl_id = :dl_id")
      int findEveningGoodPostureData(@Param("eveningStartHour") String eveningStartHour, @Param("eveningEndHour") String eveningEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Bad' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :morningStartHour AND TIME(d.dl_date) <= :morningEndHour AND d.dl_id = :dl_id")
      int findMorningBadPostureData(@Param("morningStartHour") String morningStartHour, @Param("morningEndHour") String morningEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Bad' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :afternoonStartHour AND TIME(d.dl_date) <= :afternoonEndHour AND d.dl_id = :dl_id")
      int findAfternoonBadPostureData(@Param("afternoonStartHour") String afternoonStartHour, @Param("afternoonEndHour") String afternoonEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Bad' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :eveningStartHour AND TIME(d.dl_date) <= :eveningEndHour AND d.dl_id = :dl_id")
      int findEveningBadPostureData(@Param("eveningStartHour") String eveningStartHour, @Param("eveningEndHour") String eveningEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Turtle' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :morningStartHour AND TIME(d.dl_date) <= :morningEndHour AND d.dl_id = :dl_id")
      int findMorningTurtlePostureData(@Param("morningStartHour") String morningStartHour, @Param("morningEndHour") String morningEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Turtle' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :afternoonStartHour AND TIME(d.dl_date) <= :afternoonEndHour AND d.dl_id = :dl_id")
      int findAfternoonTurtlePostureData(@Param("afternoonStartHour") String afternoonStartHour, @Param("afternoonEndHour") String afternoonEndHour, @Param("dl_id") String dl_id);

      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Turtle' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :eveningStartHour AND TIME(d.dl_date) <= :eveningEndHour AND d.dl_id = :dl_id")
      int findEveningTurtlePostureData(@Param("eveningStartHour") String eveningStartHour, @Param("eveningEndHour") String eveningEndHour, @Param("dl_id") String dl_id);

      
      // 파이차트 부분
      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Good' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :StartHour AND TIME(d.dl_date) <= :EndHour AND d.dl_id = :dl_id")
      int findGoodData(@Param("StartHour") String StartHour, @Param("EndHour") String EndHour, @Param("dl_id") String dl_id);
      
      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Bad' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :StartHour AND TIME(d.dl_date) <= :EndHour AND d.dl_id = :dl_id")
      int findBadData(@Param("StartHour") String StartHour, @Param("EndHour") String EndHour, @Param("dl_id") String dl_id);
      
      @Query("SELECT count(d) FROM DrLive d WHERE d.dl_result = 'Turtle' AND DATE(d.dl_date) = CURDATE() AND TIME(d.dl_date) >= :StartHour AND TIME(d.dl_date) <= :EndHour AND d.dl_id = :dl_id")
      int findTurtleData(@Param("StartHour") String StartHour, @Param("EndHour") String EndHour, @Param("dl_id") String dl_id);
      
      // 도넛차트 부분
      @Query(value = "SELECT dlr_good FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 1 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      int findGoodPostureDataByDateAndDlrId(@Param("dlr_id") String dlr_id);
      
      @Query(value = "SELECT dlr_bad FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 1 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      int findBadPostureDataByDateAndDlrId(@Param("dlr_id") String dlr_id);
      
      @Query(value = "SELECT dlr_turtle FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 1 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      int findTurtlePostureDataByDateAndDlrId(@Param("dlr_id") String dlr_id);

      @Query(value = "SELECT dlr_emp FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 1 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      int findEmpPostureDataByDateAndDlrId(@Param("dlr_id") String dlr_id);

      
      // 라인차트 부분
      @Query(value = "SELECT dlr_good FROM dr_live_result WHERE DAYNAME(dlr_date) = :dayName AND WEEK(dlr_date) = WEEK(CURDATE()) AND dlr_id = :dlr_id", nativeQuery = true)
      int findGoodPostureDataByDay(@Param("dayName") String dayName, @Param("dlr_id") String dlr_id);

      @Query(value = "SELECT dlr_bad FROM dr_live_result WHERE DAYNAME(dlr_date) = :dayName AND WEEK(dlr_date) = WEEK(CURDATE()) AND dlr_id = :dlr_id", nativeQuery = true)
      int findBadPostureDataByDay(@Param("dayName") String dayName, @Param("dlr_id") String dlr_id);

      @Query(value = "SELECT dlr_turtle FROM dr_live_result WHERE DAYNAME(dlr_date) = :dayName AND WEEK(dlr_date) = WEEK(CURDATE()) AND dlr_id = :dlr_id", nativeQuery = true)
      int findTurtlePostureDataByDay(@Param("dayName") String dayName, @Param("dlr_id") String dlr_id);
      
      // 피드백용
      @Query(value = "SELECT dlr_good FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 1 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      Optional<Integer> findOneGood(@Param("dlr_id") String dlr_id);
      
      @Query(value = "SELECT dlr_good FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 2 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      Optional<Integer> findTwoGood(@Param("dlr_id") String dlr_id);
      
      @Query(value = "SELECT dlr_bad FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 1 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      Optional<Integer> findOneBad(@Param("dlr_id") String dlr_id);
      
      @Query(value = "SELECT dlr_bad FROM dr_live_result WHERE DATE(dlr_date) = DATE(CURDATE() - INTERVAL 2 DAY) AND dlr_id = :dlr_id LIMIT 1", nativeQuery = true)
      Optional<Integer> findTwoBad(@Param("dlr_id") String dlr_id);
      
      // 실시간 자세 알람
      @Query(value = "SELECT * FROM dr_live WHERE (dl_id,dl_date) IN (SELECT d.dl_id,max(d.dl_date) FROM dr_live d WHERE d.dl_result IN :dlResults AND d.dl_Id = :dlId GROUP BY d.dl_Id)", nativeQuery = true)
      DrLive findTopByDlIdAndDlResultInOrderByDlDateDesc(@Param("dlId") String userId,@Param("dlResults") Collection<String> results);

      
   }