package com.smhrd.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;


@Data
@Entity
@Table(name = "dr_pose")
public class DrPose {
	
		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long dpIdx;
	    private String dpId;
	    private String dpStat;
	    private String dpImg; // 원본 이미지 경로
	    private String dpReImg; // 결과 이미지 경로
	    private String dpValues;
	    private String dpResult;
	     
	    
	    
}


