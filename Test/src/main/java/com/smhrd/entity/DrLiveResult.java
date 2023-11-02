package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "dr_live_result")
public class DrLiveResult {
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long dlr_idx;
    
    private String dlr_id;
    private String dlr_good;
    private String dlr_bad;
    private String dlr_turtle;
    private String dlr_emp;
    private String dlr_many;
    private String dlr_stand;
    
}
