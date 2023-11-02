package com.smhrd.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.DrMember;
import com.smhrd.entity.DrPose;


@Repository
public interface DrPoseRepository extends JpaRepository<DrPose, Long> {
	
	    List<DrPose> findTop2ByDpIdOrderByDpIdxDesc(String dpId);

}
