package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.ChallengeDaoI;
import com.dao.ValidateDaoImpl;
import com.dao.ValidationDaoI;
import com.entity.Admin;
import com.entity.User;

@Controller
public class SessionController {

	@Autowired
	private ValidateDaoImpl validdao;	

	public ValidateDaoImpl getValiddao() {
		return validdao;
	}

	public void setValiddao(ValidateDaoImpl validdao) {
		this.validdao = validdao;
	}


	@RequestMapping(value="user.htm",method=RequestMethod.GET)
	public String index1(HttpServletRequest request,Model model, HttpSession session ){
		System.out.println(request.getSession().getAttribute("flag"));
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		int id=(Integer)(session.getAttribute("user_id"));
		Map<String,List<Integer[]>> map = validdao.performance(id);
		System.out.println(map.get(0));
		model.addAttribute("map", map);
		return "User_Console";
	}

	
	@RequestMapping(value="admin_login.htm",method=RequestMethod.GET)
	public String index2(Model model){		
		return "Admin_Login";
	}
	
	
	@RequestMapping(value="indexhome.htm",method=RequestMethod.GET)
	public String index3(Model model){		
		return "redirect: reg.htm";
	}
	
	
	@RequestMapping(value="addadmin.htm",method=RequestMethod.GET)
	public void addAdmin(@ModelAttribute("admin") Admin admin,Model model){
		
		Admin ad=new Admin();
		ad.setAdmin_id(admin.getAdmin_id());
		ad.setFirst_name(admin.getFirst_name());
		ad.setLast_name(admin.getLast_name());
		ad.setEmail(admin.getEmail());
		ad.setPassword(admin.getPassword());
		validdao.addAdmin(ad);
	}
	
	@RequestMapping(value="alogin.htm",method=RequestMethod.POST)
	public String setiSession(HttpServletRequest request,Model model){
		
		String name=request.getParameter("uname");
		String password=request.getParameter("pwd");
		if(name.equals("admin1234")&&password.equals("qwer1234")){
			
			Admin admin=new Admin();
				HttpSession sess=request.getSession();
				sess.setAttribute("user_id","admin1234");
				sess.setAttribute("flag", 1);
				return "Admin_Console";
			
			
		}
		return "Admin_Login";
		
	}
	
	
	
	
	
	
	@RequestMapping(value="login.htm",method=RequestMethod.POST)
	public String setSession(HttpServletRequest request,Model model){
		
		String name=request.getParameter("uname");
		String password=request.getParameter("pwd");
	
		
			User user=validate(name,password);
			if(user!=null){
				HttpSession sess=request.getSession();
				sess.setAttribute("user_id",user.getUser_id());
				sess.setAttribute("firstname",user.getFirst_name());
				sess.setAttribute("username",user.getUsername());
				sess.setAttribute("flag", 0);
				Map<String,List<Integer[]>> map = validdao.performance(user.getUser_id());
				System.out.println(map.get(0));
				model.addAttribute("map", map);
				return "User_Console";
			}
			model.addAttribute("invaliduserlogin","The username and password do not match");
			return "Register";

		
	}
	
	public Admin validateAdmin(String name,String password){
		Admin admin=validdao.validateAdmin(name, password);
		return admin;
	}
	public User validate(String name,String password){
		User user=validdao.validateUser(name, password);
		return user;
	}
	@RequestMapping(value="logout.htm",method=RequestMethod.GET)
	public String destroySession(HttpServletRequest request,Model model){
		
		int flag=0;
		
		HttpSession sess=request.getSession(false);
		
		
		if(sess!=null){
			flag=(int) sess.getAttribute("flag");
			sess.invalidate();
		}
		if(flag==1)
		return "Admin_Login";
		else
		return "redirect: reg.htm";
			
	}
}
