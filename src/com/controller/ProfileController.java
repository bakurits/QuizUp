package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;






import com.dao.ProfileDaoI;
import com.dao.ProfileDaoImpl;
import com.entity.User;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileDaoI profiledao;

	public void setProfiledao(ProfileDaoI profiledao) {
		this.profiledao = profiledao;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("UpdateUser")User user, Model model) {
		profiledao.updatePassword(user.getUsername(),user.getPassword());
		profiledao.updateEmail(user.getUsername(), user.getEmail());
		profiledao.updateFirstName(user.getUsername(), user.getFirst_name());
		profiledao.updateLastName(user.getUsername(), user.getLast_name());
		profiledao.updatePicture(user.getUsername(), user.getProfile_pic());
		return "updated_page";
	}
	 
}
