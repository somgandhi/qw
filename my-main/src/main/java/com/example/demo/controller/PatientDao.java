package com.example.demo.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Appointment;
import com.example.demo.entity.AppointmentEntity;
import com.example.demo.entity.DoctorEntity;
import com.example.demo.entity.HospitalEntity;
import com.example.demo.entity.PatientEntity;
import com.example.demo.enums.AptStatus;
import com.example.demo.service.AppointmentService;
import com.example.demo.service.DoctorService;
import com.example.demo.service.HospitalService;
import com.example.demo.service.PatientService;

@Controller
@RequestMapping("/patient")
public class PatientDao {

	@Autowired
	PatientService patientService;
	
	@Autowired
	DoctorService doctorService;

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	AppointmentService  appointmentService;

	// show
	@GetMapping("/reg")
	public ModelAndView show() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}

	// create
	@PostMapping("/registered")
	public ModelAndView create(String ptName, String age, String ptGmail, String ptMobile, String ptUsername,
			String ptPassword) {
		ModelAndView mv = new ModelAndView("register");
		int ptAge = Integer.parseInt(age);
		PatientEntity patientEntity = new PatientEntity(ptName, ptAge, ptGmail, ptMobile, ptUsername, ptPassword);
		patientService.create(patientEntity);
		mv.addObject("patReg", 1);
		return mv;
	}

	@GetMapping("/login")
	public ModelAndView log() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	@PostMapping("/AuthPtlogin")
	public ModelAndView Authenticatepatient(String ptUsername, String ptPassword) {
		PatientEntity patientEntity = patientService.Authenticatepatient(ptUsername, ptPassword);
		if (patientEntity != null) {
			ModelAndView mv = new ModelAndView("Appointment");
			mv.addObject("patient", patientEntity);		
			
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("ptLogFail", 0);
			return mv;
		}
	}
	
	@PostMapping("/showPatientProf")
	public ModelAndView showPatientProf(String id) {
		PatientEntity patientEntity = patientService.patientUpdateOpt(id);		 
			ModelAndView mv = new ModelAndView("Appointment");
			mv.addObject("patient", patientEntity);
			mv.addObject("patProf", 1 );
			return mv;
		
	}

	@PostMapping("/update-opt")
	public ModelAndView patientUpdateOpt(String id) {
		PatientEntity patientEntity = patientService.patientUpdateOpt(id);
		if (patientEntity != null) {
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 2);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 3);
			return mv;
		}
	}

	@PostMapping("/upd-patient")
	public ModelAndView patientupdated(String id, String ptName, String age, String ptGmail, String ptMobile) {
		PatientEntity patientEntity = patientService.patientupdated(id, ptName, age, ptGmail, ptMobile);
		if (patientEntity != null) {
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 1);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 0);
			return mv;
		}

	}
	
	
	@PostMapping("/bookAppBtn")
	public ModelAndView bookAppoint(String ptid){
		ModelAndView mv=new ModelAndView("bookAptShowHspList"); 
		PatientEntity patientEntity=patientService.getSinglePatient(ptid);
		 mv.addObject("patient", patientEntity);
			List<HospitalEntity> hspList = hospitalService.hspList();
			mv.addObject("hspList", hspList);
			mv.addObject("HSPLIST", 1);
			return mv;
	}
	
	
	 // read all doctor list as per hspId
	  @PostMapping("/drList") 
	  public ModelAndView drList(String hspid, String ptid) { 
		  List<DoctorEntity> drList=doctorService.drList(hspid);
		  PatientEntity patientEntity =patientService.getSinglePatient(ptid);
	  ModelAndView mv = new ModelAndView("viewDoctorForApt"); 
	  mv.addObject("patient",  patientEntity); // List<DoctorEntity> drList=doctorRepository.findAll(); //
	  mv.addObject("drList", drList); 
	   mv.addObject("DRLIST", 1); 
	   return mv;
     }
	 
     @PostMapping("/aptBooking")
     public ModelAndView aptBooking(String appdate,String ptid,String drid ){
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);
    	// AptStatus aptStatus=AptStatus.BOOKED;
    	// int doctId=Integer.parseInt(drid);
    	// int patId=Integer.parseInt(ptid);  	
    	 //Appointment appointment=new Appointment(aptStatus,appdate,patId,doctId);
    	 
    	 appointmentService.aptBooking(appdate,ptid,drid);
    	 ModelAndView mv=new ModelAndView("viewDoctorForApt"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("b",1);
    	 System.out.println("appointment booked succesfully");
    	 return mv;
     }
     
     @PostMapping("/aptinfoWindow")
     public ModelAndView aptinfoWindow(String ptid){
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);
    	List<Appointment> aptList=appointmentService.getAptListPt(ptid);
    	 ModelAndView mv=new ModelAndView("appointmentInfo"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("aptList",  aptList);
    	 mv.addObject("APTLIST", 1);  
    	 
    	// List< Patient> patientList =patientService.getAllPatient();
    	 //mv.addObject("patientList",  patientList);
    	 
    	 //fetch doctorlist on patient appointment table to display doctor name on front end
    	 List<DoctorEntity> drList=doctorService.allDoctor();
    	 mv.addObject("drList",  drList);
    	 return mv;
     }
     
     @PostMapping("/aptCancel")
     public ModelAndView aptCancel(String ptid,String drid){
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);    	  	   
    	 appointmentService.aptCancel(ptid,drid);
    	 ModelAndView mv=new ModelAndView("appointmentInfo"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("c",1);
    	 System.out.println("appointment cancelled");
    	 return mv;
     }
     
     
}
