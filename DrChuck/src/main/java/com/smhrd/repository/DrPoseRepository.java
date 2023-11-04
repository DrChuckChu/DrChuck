package com.smhrd.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.DrMember;
import com.smhrd.entity.DrPose;


@Repository
public interface DrPoseRepository extends JpaRepository<DrPose, Long> {
	
	
	List<DrPose> findTop2ByDpIdOrderByDpIdxDesc(String dpId);
	
	
	// select dp_idx, dp_re_img from dr_pose where dp_id = '9' order by dp_idx desc limit 2;

}
