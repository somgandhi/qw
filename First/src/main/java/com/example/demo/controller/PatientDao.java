package com.example.demo.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.EmailSenderService;
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
	
	@Autowired
	EmailSenderService emailSenderService ;

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
		try {
		//encrypt pass using hashPassword() method
		PatientDao patientDao=new PatientDao();		
		String encrpPassUser=patientDao.hashPassword(ptPassword);
		
		ModelAndView mv = new ModelAndView("register");
		int ptAge = Integer.parseInt(age);
		PatientEntity patientEntity = new PatientEntity(ptName, ptAge, ptGmail, ptMobile, ptUsername, encrpPassUser);
		patientService.create(patientEntity);
		
		emailSenderService.sendSimpleEmail(ptGmail,
				"You have successfully registered with DoctorHub... You can log with following credentials "
					+" Username: "	+ptUsername  + "  Password: " + ptPassword,
					"From DoctorHub!!!");
		
		
		
		mv.addObject("patReg", 1);
		return mv;
		}
		catch(Exception e) {
			ModelAndView mv = new ModelAndView("register");
			mv.addObject("patReg", 0);
			return mv;
		}
		
	}
	
	private String hashPassword(String plainTextPassword){
		return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
	}
	

	@GetMapping("/login")
	public ModelAndView log() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	@PostMapping("/AuthPtlogin")
	public ModelAndView Authenticatepatient(String ptUsername, String ptPassword, HttpServletRequest req, HttpServletResponse res) {
		try {		 
		PatientEntity patientEntity = patientService.AuthentPatUname(ptUsername);
		
		  if (patientEntity != null) {
			PatientDao patientDao=new PatientDao();
			boolean passresult=patientDao.checkPass(ptPassword,patientEntity.getPtPassword() );
			if(passresult) {
			   ModelAndView mv = new ModelAndView("Appointment");
			   mv.addObject("patient", patientEntity);
			  

			   return mv;
		     } 
		  }
		  ModelAndView mv = new ModelAndView("login");
		   mv.addObject("ptLogFail", 0);
		   return mv;
		}
		catch(Exception e) {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("ptLogFail", 0);
			return mv;
		}	
	}
	
	private boolean checkPass(String plainPassword, String hashedPassword) {
		if (BCrypt.checkpw(plainPassword, hashedPassword)) {
			System.out.println(plainPassword + hashedPassword);
			System.out.println("The password matches.");
		    return true;
		}
		else {
			System.out.println(plainPassword + hashedPassword);
			System.out.println("The password does not match.");
		     return false;
		}
	}
	
	@PostMapping("/forgotPass")
	public ModelAndView forgotPass(String ptUsername, String ptPassword,String ptGmail) {
		PatientEntity patientEntity = patientService.AuthentPatUnameGml(ptUsername,ptGmail);
		if (patientEntity != null ) {
			ModelAndView mv = new ModelAndView("login");
			PatientDao patientDao=new PatientDao();		
			String encrpPassUser=patientDao.hashPassword(ptPassword);	
			patientEntity.setPtPassword(encrpPassUser);
			patientService.create(patientEntity);
			mv.addObject("ptPassFail", 1);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("ptPassFail", 0);
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
	public ModelAndView patientupdated(String id, String ptName, String age, String ptGmail, String ptMobile,String ptUsername) {
		try {
		    PatientEntity patientEntity = patientService.patientupdated(id, ptName, age, ptGmail, ptMobile,ptUsername);
			ModelAndView mv = new ModelAndView("updatePatientProfile");
			mv.addObject("patient", patientEntity);
			mv.addObject("u", 1);
			return mv;
		}
		catch(Exception e) {
			PatientEntity patientEntity=patientService.getSinglePatient(id);
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
    	 
    	 //patient is booking first time or second time....first time null value in appointment table and second type find set save
    	 
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid);
    	 //fetch by ptid and drid
    	 
    	 boolean alreadypresent=appointmentService.aptPresentCheck(ptid,drid);
    	 
    	 if(alreadypresent) {
    		 ModelAndView mv=new ModelAndView("viewDoctorForApt");
    		 mv.addObject("patient",  patientEntity);
    		 mv.addObject("b",2);
    		 System.out.println("appointment already present");
    		 return mv;
    	 }
    	 else {
    	 appointmentService.aptBooking(appdate,ptid,drid);
    	 ModelAndView mv=new ModelAndView("viewDoctorForApt"); 
    	 mv.addObject("patient",  patientEntity);
    	 mv.addObject("b",1);
    	 System.out.println("appointment booked succesfully");
    	 return mv;
    	 }
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
    	 
    	//fetch doctorlist on patient appointment table to display doctor name on front end
    	 List<HospitalEntity> hspList = hospitalService.hspList();
			mv.addObject("hspList", hspList);
    	 
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
     
     
     
     @PostMapping("patientPayOPt")
     public ModelAndView patientPayOPt(String ptid, String drid) {      //12
       PatientEntity patientEntity=patientService.getSinglePatient(ptid);       //12 
       
       ModelAndView mv=new ModelAndView("paymentOption");
       mv.addObject("patient",patientEntity);
       
       DoctorEntity doctorEntity=doctorService.getDoctor(drid);
       mv.addObject("doctor", doctorEntity);
       
       mv.addObject("payOnce", 5);
       return mv;       
      }
     
     @PostMapping("patientpay")
     public ModelAndView patientpay( String cardnum   , String  exp, String cvv, String ptid,String drid   ) {
    	 try{
    	 String checkcardnum="987654321098";
    	 String checkexp="07/25";
    	 String checkcvv="777";
    	 
    	 PatientEntity patientEntity=patientService.getSinglePatient(ptid); 
    	 
    	 if(checkcardnum.equals(cardnum) && checkexp.equals(exp) && checkcvv.equals(cvv) ) {
    		 
    		 //check payment already done for ptid and drid means check aptStatus CONFIRMED if confirmed means payment done
    		 //method already written in appointmentservice just call here 
    		 
    		/* boolean alreadypresent=appointmentService.aptPresentCheck(ptid,drid);
    		 if(alreadypresent) {
    			 ModelAndView mv=new ModelAndView("paymentOption");
        		 mv.addObject("payment",2);                                      //2 for payment already done dont do it again
        		 mv.addObject("patient",patientEntity);   		 
        		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
        	       mv.addObject("doctor", doctorEntity);
            	 System.out.println("payment already done");
        		 return mv;
    		 }
    		 */
    		 
    		 ModelAndView mv=new ModelAndView("paymentOption");
    		 mv.addObject("payment",1);
    		 mv.addObject("patient",patientEntity);   		 
    		 appointmentService.aptConfirmed(ptid,drid);
    		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
    	       mv.addObject("doctor", doctorEntity);
        	 System.out.println("appointment confirmed with successfully payment");
    		 return mv;
    	 }
    	 else {
    		 ModelAndView mv=new ModelAndView("paymentOption");
    		 mv.addObject("payment",0);
    		 mv.addObject("patient",patientEntity);
    		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
    	       mv.addObject("doctor", doctorEntity);
        	 System.out.println("appointment not confirmed bcz payment fail");
    		 return mv; 
    	 }
    	 }
    	 catch(Exception e) {
    		 PatientEntity patientEntity=patientService.getSinglePatient(ptid); 
    		 ModelAndView mv=new ModelAndView("paymentOption");
    		 mv.addObject("patient",patientEntity);
    		 DoctorEntity doctorEntity=doctorService.getDoctor(drid);
    	       mv.addObject("doctor", doctorEntity);
    	       mv.addObject("payment",0);
        	 System.out.println("appointment not  confirmed bcz payment fail");
    		 return mv; 
    	 }
    	 
     }
       
}
