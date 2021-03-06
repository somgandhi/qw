package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Appointment;
import com.example.demo.entity.AppointmentEntity;
import com.example.demo.entity.DoctorEntity;
import com.example.demo.entity.PatientEntity;
import com.example.demo.enums.AptStatus;
import com.example.demo.repository.DoctorRepository;
import com.example.demo.service.AppointmentService;
import com.example.demo.service.DoctorService;
import com.example.demo.service.PatientService;

@Controller
@RequestMapping("/dr")
public class DoctorDao {
	
	@Autowired
	AppointmentService appointmentService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	PatientService patientService;

	//@Autowired
	//DoctorRepository doctorRepository;
		
	@GetMapping("/login")
	public ModelAndView drLog() {
		ModelAndView mv=new ModelAndView("DrLogin");
		return mv;
	}
	
	//@RequestMapping(value="/Authentdrlogin" ,method=RequestMethod.GET)	
	@PostMapping("/Authentdrlogin")
	public ModelAndView AuthenticateDoctor(String drUsername,String drPassword) {		
		DoctorEntity doctorEntity=doctorService.AuthenticateDoctor(drUsername, drPassword);		
		if(doctorEntity!=null) {
			ModelAndView mv=new ModelAndView("Appointment-list");
			mv.addObject("doctor", doctorEntity);
			return mv;
		}		
		else {
			ModelAndView mv=new ModelAndView("DrLogin");
			mv.addObject("drLogFail", 0);
			return mv;        
		}
	}
	
	//read appointment list using drid and all booked closed cancelled
	@PostMapping("/AllpatAptlist")
    public ModelAndView AllpatAptlist(String drid) {
   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
   	  	      	List<Appointment> AllpatAptlist=appointmentService.AllpatAptlist(drid);
   	  	         mv.addObject("doctor", doctorEntity); 	  	        
   	  	         mv.addObject("AllpatAptlist", AllpatAptlist);
   	  	         mv.addObject("allPatAptlist", 1);
   	  	         
   	  	     //fetch patient list on doctor see all patient list table to display patient name on front end
   		   	  	List< PatientEntity> patientList =patientService.getAllPatient();
   		   	    mv.addObject("patientList",  patientList);
   	  	         
			    return mv;
    }
	
	
	//read appointment list using drid and booked
		@PostMapping("/Appointpatientlist")
	    public ModelAndView Appointpatientlist(String drid) {
			       AptStatus aptStatus=AptStatus.BOOKED;
	   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
	   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
	   	  	      	List<Appointment> Appointpatientlist=appointmentService.Appointpatientlist(drid,aptStatus);
	   	  	         mv.addObject("doctor", doctorEntity); 	  	        
	   	  	         mv.addObject("Appointpatientlist", Appointpatientlist);
	   	  	         mv.addObject("appointPatientlist", 1);
	   	  	  
	   	  	  //fetch patient list on doctor see appointment table to display patient name on front end
	   	  	List< PatientEntity> patientList =patientService.getAllPatient();
	   	    mv.addObject("patientList",  patientList);
				    return mv;
	    }
		
		@PostMapping("/AptCloseByDr")
	    public ModelAndView AppCloseByDr(String ptid,String drid) {
			      appointmentService.aptClosed(ptid, drid);
			
			       AptStatus aptStatus=AptStatus.BOOKED;
	   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
	   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
	   	  	      	List<Appointment> Appointpatientlist=appointmentService.Appointpatientlist(drid,aptStatus);
	   	  	         mv.addObject("doctor", doctorEntity); 	  	        
	   	  	         mv.addObject("Appointpatientlist", Appointpatientlist);
	   	  	         mv.addObject("appointPatientlist", 1);
	   	  	         
	   	  	    //fetch patient list on doctor see appointment table to display patient name on front end
	   		   	  	List< PatientEntity> patientList =patientService.getAllPatient();
	   		   	    mv.addObject("patientList",  patientList);
				    return mv;
	    }
	
		@PostMapping("/AptCancelByDr")
	    public ModelAndView AptCancelByDr(String ptid,String drid) {
			      appointmentService.aptCancel(ptid, drid);
			
			       AptStatus aptStatus=AptStatus.BOOKED;
	   	      	    ModelAndView mv=new ModelAndView("Appointment-list");
	   	      	DoctorEntity doctorEntity=doctorService.getDoctor(drid);
	   	  	      	List<Appointment> Appointpatientlist=appointmentService.Appointpatientlist(drid,aptStatus);
	   	  	         mv.addObject("doctor", doctorEntity); 	  	        
	   	  	         mv.addObject("Appointpatientlist", Appointpatientlist);
	   	  	         mv.addObject("appointPatientlist", 1);
	   	  	         
	   	  	    //fetch patient list on doctor see appointment table to display patient name on front end
	   		   	  	List< PatientEntity> patientList =patientService.getAllPatient();
	   		   	    mv.addObject("patientList",  patientList);
				    return mv;
	    }
		
		@PostMapping("/doctProfile")
		public ModelAndView doctProfile(String drid) {		
			DoctorEntity doctorEntity=doctorService.getDoctor(drid);
			
				ModelAndView mv=new ModelAndView("doctorProfile");
				mv.addObject("doctor", doctorEntity);
				return mv;
			     
			
		}
}
