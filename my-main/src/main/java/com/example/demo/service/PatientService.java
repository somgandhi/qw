package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;


import com.example.demo.entity.PatientEntity;
import com.example.demo.repository.PatientRepository;

@Service
public class PatientService {

	@Autowired
	PatientRepository patientRepository;
	
	public PatientEntity getSinglePatient(String ptId) {
		int patId=Integer.parseInt(ptId);
		PatientEntity PatientEntity=patientRepository.findById(patId);
		return PatientEntity;
	}
	
	public List<PatientEntity> getAllPatient() {
		List<PatientEntity> patientEntities=patientRepository.findAll();		
		return patientEntities;
	}

	// @PostMapping("/registered")
	public void create(PatientEntity patientEntity) {
		patientRepository.save(patientEntity);
	}

	// @PostMapping("/AuthPtlogin")
	public PatientEntity Authenticatepatient(String ptUsername, String ptPassword) {
		PatientEntity PatientEntity = patientRepository.findByPtUsernameAndPtPassword(ptUsername, ptPassword);
		if (PatientEntity != null) {
			return PatientEntity;
		} else {
			return null;
		}
	}

	// @PostMapping("/update-opt")
	public PatientEntity patientUpdateOpt(String id) {
		int ptId = Integer.parseInt(id);
		PatientEntity patientEntity = patientRepository.findById(ptId);
		return patientEntity;
	}

	// @PostMapping("/upd-patient")
	public PatientEntity patientupdated(String id, String ptName, String age, String ptGmail, String ptMobile) {
		int ptId = Integer.parseInt(id);
		int ptAge = Integer.parseInt(age);
		PatientEntity patientEntity = patientRepository.findById(ptId);
		
		if (patientEntity != null) {
			patientEntity.setPtId(ptId);
			patientEntity.setPtName(ptName);
			patientEntity.setPtAge(ptAge);
			patientEntity.setPtGmail(ptGmail);
			patientEntity.setPtMobile(ptMobile);

			
			patientRepository.save(patientEntity);
			return patientEntity;
		} else {
			// check here this is null patient
			return patientEntity;
		}
	}
	
	
	
}
