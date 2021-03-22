package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.PatientEntity;

public interface PatientRepository extends JpaRepository<PatientEntity, Integer>{

	PatientEntity findByPtUsernameAndPtPassword(String ptUsername,String ptPassword);
	
	PatientEntity findById(int ptId);
	
	PatientEntity findByPtUsername(String ptUsername);
	
	PatientEntity findByPtUsernameAndPtGmail(String ptUsername,String ptGmail);
}
