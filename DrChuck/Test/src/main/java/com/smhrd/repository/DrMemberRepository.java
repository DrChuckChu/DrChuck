package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.DrMember;


@Repository
public interface DrMemberRepository extends JpaRepository<DrMember, String>{
	// Jpa : no Sql
	// JPA의 DAO(Repository)는 interface로 구현
	// JpaRepository interface를 상속 받음
	// JpaRepository<테이블 역할의 DTO, 기본키의 자료형>
	
	// 기본적으로 사용자들이 많이 사용하는 기능들을 미리 정의 = JpaRepository
	// -> 우리가 코딩을 하지 않아도 기본적인 메소드들을 사용할 수 있다.
	
	/*
	 findAll() : select * from member;
	 findById(String id) : select * from member where email = #{email}
	 
	 save(Member member) : insert, update
	 member.email이 db에 존재한다면 update
	 없으면 insert
	 
	 // 로그인을 하기위해선 where email,pw가 필요함 이런경우 어떻게함?
	  직접 메소드를 만들면 된다
	  
	  메소드의 이름을 기반으로 sql문을 생성
	  카멜기법으로만 만들어야함 
	  By절에 있는 컬럼의 이름이 잘 일치해야함
	  
		@Query("Sql문") 이런 방법이 있는데 1줄로 작성해야 꼴보기 싫음
		public Member 
	 */


	public DrMember findByDmIdAndDmPw(String dmId, String dmPw); // 로그인시 사용
	
	
	public DrMember findByDmNameAndDmEmail(String dmName, String dmEmail); // 아이디 찾기
	
	public DrMember findByDmIdAndDmEmail(String dmId, String dmEmail); // 비밀번호 찾기
	
	
	public DrMember findByDmId(String dmId);
	
	boolean existsByDmId(String dmId);
	
    boolean existsByDmEmail(String dmEmail);
	
}
