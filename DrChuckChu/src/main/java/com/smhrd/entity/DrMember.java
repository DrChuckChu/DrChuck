package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
public class DrMember {

	@Id
	@Column(length = 100, updatable = false) // column의 상세 특징을 정의
	private String dmId;
	
	private String dmPw;
	private String dmName;
	private String dmKey;
	private String dmMuge;
	private String dmSex;
	private String dmJob;
	private String dmEmail;
	
	
	
	
	
}
