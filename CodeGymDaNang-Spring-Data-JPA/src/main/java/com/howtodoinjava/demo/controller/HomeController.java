package com.howtodoinjava.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/")
public class HomeController {
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
    public ModelAndView setupForm() {
    	ModelAndView model = new ModelAndView("home");

 		return model;
    }   
}
