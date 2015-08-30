package com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.RegistrationDaoI;
import com.dao.RegistrationDaoImpl;
import com.entity.User;

@Controller
public class RegistrationController {
	
	@Autowired
	private RegistrationDaoI regdao;

	public void setRegdao(RegistrationDaoI regdao,Model model) {
		this.regdao = regdao;
		
	}
	
	

	@RequestMapping(value = "reg.htm", method = RequestMethod.GET)
	public String register(Model model) {
		model.addAttribute("RegisterUser",new User());
		/*Map<String,List<String>> map = regdao.getCategories();
		model.addAttribute("map", map);*/
		return "Register";
	}
	
	
	@RequestMapping(value = "adduser.htm", method = RequestMethod.POST)
	public String registerUser(@RequestParam("first") String first,@RequestParam("last") String last,@RequestParam("user") String user,@RequestParam("email") String email,@RequestParam("password") String password, Model model) {
		
		
		
		regdao.addUser(regdao.maxKey("User", "user_id")+1,user, first, last,null,email, password);
		return "Register";
	}

}
