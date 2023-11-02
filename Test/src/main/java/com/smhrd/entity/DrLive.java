package com.smhrd.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name = "dr_live")
public class DrLive {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long dl_idx; //자세 순번
    
    private String dl_id; // 사용자 아이디
    @Temporal(TemporalType.TIMESTAMP)
    private Date dl_date; // 추가된 시간
    private String dl_valuse; // 자세 값
    private String dl_result;  // 측정결과
    //측정결과
    // 1 좋은자세, 2 나쁜자세, 3 거북목, 4 자리비움, 5 다수, 6 기상
}
