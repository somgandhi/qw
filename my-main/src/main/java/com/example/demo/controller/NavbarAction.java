package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.entity.DoctorEntity;
import com.example.demo.entity.HospitalEntity;
import com.example.demo.repository.HospitalRepository;
import com.example.demo.service.HospitalService;

@Controller
@RequestMapping("/")
public class NavbarAction {
     
	//@Autowired
	//HospitalRepository hospitalRepository;
	
	@Autowired 
	HospitalService hospitalService;
	
	@GetMapping("home")
	public ModelAndView showHome() {
		ModelAndView mv=new ModelAndView("Home");
		return mv;
	}
	
	
	@RequestMapping("hospitalList")
    public ModelAndView viewHomePage( @Param("keyword") String keyword) {
		ModelAndView mv=new ModelAndView("HospitalList");
		 List<HospitalEntity> hospitallist=hospitalService.listAll(keyword);    
		 mv.addObject("hospitallist", hospitallist);
		 mv.addObject("keyword", keyword);
         
        return mv;
    }
	
	
	
	@GetMapping("doctorlist")
	public ModelAndView showdoctlist(String hspid) {
		//int hospid=Integer.parseInt(hspid);
		HospitalEntity hospital=hospitalService.getHospital(hspid);
		List<DoctorEntity> drList=hospital.getDoctorList();
		ModelAndView mv=new ModelAndView("doctorlist");
		mv.addObject("hospital", hospital);
		mv.addObject("drList", drList);
		return mv;
	}
	
	@GetMapping("searchOpt")
	public ModelAndView ddd() {
		ModelAndView mv=new ModelAndView("searchOpt");
		return mv;
	}
	
	
	@GetMapping("aboutus")
	public ModelAndView aboutus() {
		ModelAndView mv=new ModelAndView("AboutUs");
		return mv;
	}
	
	@GetMapping("contactus")
	public ModelAndView contactus() {
		ModelAndView mv=new ModelAndView("contactus");
		return mv;
	}
	
}
