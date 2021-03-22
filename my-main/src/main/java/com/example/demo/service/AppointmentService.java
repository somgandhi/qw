package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.example.demo.converter.AppointmentConverter;
import com.example.demo.dao.Appointment;

import com.example.demo.entity.AppointmentEntity;
import com.example.demo.enums.AptStatus;
import com.example.demo.repository.AppointmentRepository;

@Service
public class AppointmentService {
	
	@Autowired AppointmentRepository appointmentRepository;
	
	@Autowired AppointmentConverter appointmentConverter;
	
	//patient having all appointment list
	public List<Appointment>  getAptListPt(String ptid){
		 int patId=Integer.parseInt(ptid); 		 
		List<AppointmentEntity> appointmentEntity=appointmentRepository.findByPtId(patId);
		List<Appointment>  appointments=new ArrayList<>();		
		for(AppointmentEntity appointmentEnt:appointmentEntity) {
			appointments.add(appointmentConverter.AppointmentEntityToAppointment(appointmentEnt));
		}	
		return appointments;
	}
	
	
	//patient with only booked appointment
	public List<Appointment>  getBookAptListPt(String ptid){
		AptStatus aptStatus=AptStatus.BOOKED;
		 int patId=Integer.parseInt(ptid); 		 
		List<AppointmentEntity> appointmentEntity=appointmentRepository.findByPtIdAndAptStatus(patId,aptStatus);
		List<Appointment>  appointments=new ArrayList<>();		
		for(AppointmentEntity appointmentEnt:appointmentEntity) {
			appointments.add(appointmentConverter.AppointmentEntityToAppointment(appointmentEnt));
		}	
		return appointments;
	}	
	
	public void aptBooking(String appdate,String ptid,String drid) {
		AptStatus aptStatus=AptStatus.BOOKED;
		 int patId=Integer.parseInt(ptid); 
		 int doctId=Integer.parseInt(drid); 
		AppointmentEntity appointmentEntity=appointmentRepository.findByPtIdAndDrId(patId,doctId);
			
		if(appointmentEntity!=null) {
			Appointment appointment=appointmentConverter.AppointmentEntityToAppointment(appointmentEntity);
			appointment.setAptStatus(aptStatus);
			appointment.setAptDate(appdate);
			
			AppointmentEntity appointmentEntitySaveUpdate=appointmentConverter.AppointmentToAppointmentEntity(appointment);
			appointmentRepository.save(appointmentEntitySaveUpdate);
		}
		else {
			Appointment appointmentSave= new Appointment(aptStatus,appdate,patId,doctId);
			AppointmentEntity appointmentEntitySave=appointmentConverter.AppointmentToAppointmentEntity(appointmentSave);
			appointmentRepository.save(appointmentEntitySave);
		}
		
	}
	
	public void aptCancel(String ptid,String drid) {
		AptStatus aptStatus=AptStatus.CANCELLED;   
		 int patId=Integer.parseInt(ptid); 
		 int doctId=Integer.parseInt(drid); 
		 AppointmentEntity appointmentEntity=appointmentRepository.findByPtIdAndDrId(patId,doctId);
		 Appointment appointment=appointmentConverter.AppointmentEntityToAppointment(appointmentEntity);
		 appointment.setAptStatus(aptStatus);
		 
		 AppointmentEntity appointmentEntitySave=appointmentConverter.AppointmentToAppointmentEntity(appointment);
		 appointmentRepository.save(appointmentEntitySave);
	}
	
	
	public void aptClosed(String ptid,String drid) {
		AptStatus aptStatus=AptStatus.CLOSED;   
		 int patId=Integer.parseInt(ptid); 
		 int doctId=Integer.parseInt(drid); 
		 AppointmentEntity appointmentEntity=appointmentRepository.findByPtIdAndDrId(patId,doctId);
		 Appointment appointment=appointmentConverter.AppointmentEntityToAppointment(appointmentEntity);
		 appointment.setAptStatus(aptStatus);
		 
		 AppointmentEntity appointmentEntitySave=appointmentConverter.AppointmentToAppointmentEntity(appointment);
		 appointmentRepository.save(appointmentEntitySave);
	}
	
	//@PostMapping("/AllpatAptlist")
		public List<Appointment> AllpatAptlist(String drid){
			int doctId=Integer.parseInt(drid); 
			List<AppointmentEntity>appointmentEntities=appointmentRepository.findByDrId(doctId);
			List<Appointment> appointments=new ArrayList<Appointment>();
			
			for(AppointmentEntity appointmentEntity:appointmentEntities) {
				appointments.add(appointmentConverter.AppointmentEntityToAppointment(appointmentEntity));
			}
			return appointments;
		}
		
		
		//@PostMapping("/Appointpatientlist")
				public List<Appointment> Appointpatientlist(String drid,AptStatus aptStatus){
					int doctId=Integer.parseInt(drid); 
					List<AppointmentEntity>appointmentEntities=appointmentRepository.findByDrIdAndAptStatus(doctId,aptStatus);
					List<Appointment> appointments=new ArrayList<Appointment>();
					
					for(AppointmentEntity appointmentEntity:appointmentEntities) {
						appointments.add(appointmentConverter.AppointmentEntityToAppointment(appointmentEntity));
					}
					return appointments;
				}
		
		
	
	 public void deleteDrAppointments(String drid){
		int doctId=Integer.parseInt(drid);
		List<AppointmentEntity>appointmentEntities=appointmentRepository.findByDrId(doctId);

		appointmentRepository.deleteAll(appointmentEntities);

	 }
	
	
	
	
}
