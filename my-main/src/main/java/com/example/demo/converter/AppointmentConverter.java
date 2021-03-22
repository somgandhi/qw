package com.example.demo.converter;

import org.springframework.stereotype.Component;

import com.example.demo.dao.Appointment;
import com.example.demo.entity.AppointmentEntity;

@Component
public class AppointmentConverter {
        
	public Appointment AppointmentEntityToAppointment(AppointmentEntity appointmentEntity) {
		Appointment appointment=new Appointment();
		appointment.setAptId(appointmentEntity.getAptId());
		appointment.setAptStatus(appointmentEntity.isAptStatus());
		appointment.setAptDate(appointmentEntity.getAptDate());
		appointment.setPtId(appointmentEntity.getPtId());
		appointment.setDrId(appointmentEntity.getDrId());
		return appointment;
	}
	
	public AppointmentEntity AppointmentToAppointmentEntity(Appointment appointment) {
		AppointmentEntity appointmentEntity=new AppointmentEntity();
		appointmentEntity.setAptId(appointment.getAptId());
		appointmentEntity.setAptStatus(appointment.getAptStatus());
		appointmentEntity.setAptDate(appointment.getAptDate());
		appointmentEntity.setPtId(appointment.getPtId());
		appointmentEntity.setDrId(appointment.getDrId());
		return appointmentEntity;
	}
}
