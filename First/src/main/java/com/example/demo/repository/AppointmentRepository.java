package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.AppointmentEntity;
import com.example.demo.enums.AptStatus;

public interface AppointmentRepository extends JpaRepository<AppointmentEntity, Integer>  {
	
	
	AppointmentEntity findByPtIdAndDrId(int patId,int doctId);
	
	List<AppointmentEntity> findByPtId(int patId);
	
	List<AppointmentEntity> findByPtIdAndAptStatus(int patId,AptStatus aptStatus);
	
	List<AppointmentEntity> findByDrId(int drId);
	
	List<AppointmentEntity> findByDrIdAndAptStatus(int drid,AptStatus aptStatus);
	
	AppointmentEntity findByPtIdAndDrIdAndAptStatus(int patId,int doctId,AptStatus aptStatus);
	
	List<AppointmentEntity> findByPtIdOrderByAptDateDesc(int patId);
	
	List<AppointmentEntity> findByDrIdOrderByAptDateDesc(int drId);
	
	List<AppointmentEntity> findByDrIdAndAptStatusOrderByAptDateAsc(int drid,AptStatus aptStatus);
}
