package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.AdminDao;
import com.dao.ChallengeDaoImpl;
import com.entity.Category;
import com.entity.QuestionBank;
import com.entity.User;

@Controller
public class ChallengeController {

	@Autowired
	private ChallengeDaoImpl challengedao;
	@Autowired
	AdminDao adminDao;

	public void setDao(ChallengeDaoImpl challengedao) {
		this.challengedao = (ChallengeDaoImpl) challengedao;
	}
	/*
	@RequestMapping(value="Challenge.htm",method=RequestMethod.GET)
	public String showIQuesinCat(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		HttpSession sess=request.getSession(false);
		Integer uid=null;
		if(sess!=null){
			uid=(Integer)sess.getAttribute("user_id");
			model.addAttribute("categoryname",new Category());
			model.addAttribute("catlist", challengedao.viewCategories());
			model.addAttribute("userlist",challengedao.viewUsers((int)uid));
			
		}
		return "zerochal";
	}*/
	
	@RequestMapping(value="viewchallenges.htm",method=RequestMethod.GET)
	public String getChallengeRequests(HttpServletRequest request,Model model){
		
		HttpSession sess=request.getSession(false);
		if(sess!=null){
			
			List<String> challengerList=challengedao.getChallenge((Integer)sess.getAttribute("user_id"));
			model.addAttribute("challengerList",challengerList);
			return "challengelist";
		}
		return "";
	}
	
	@RequestMapping(value = "startchallenge1.htm", method = RequestMethod.POST)
	public String startChallenge(@ModelAttribute("user") User u1,HttpSession session,HttpServletRequest request,
			Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		String category=(String)session.getAttribute("categoryhai");
		String challengee_name = u1.getUsername();
		int user_id = challengedao.getUserId(challengee_name);
		session.setAttribute("challengee_id", user_id);
		List<QuestionBank> lst=adminDao.viewQuestionByCat(category);
		if(lst.size()==0){
			return "zeroques";
		}
		session.setAttribute("elist",lst);
		String str="";
		for(QuestionBank q:lst){
			str+=q.getQues_id()+"-";
		}
		session.setAttribute("quesstring",str);
		
		return "arpit2";
	}
	
	@RequestMapping(value="finishchallenge.htm", method = RequestMethod.GET )
	public String setChallenge(HttpServletRequest request, Model model){
		HttpSession sess = request.getSession();
		int ch_id = (int) sess.getAttribute("challenge_id");  //needs something to be resolved
		int challenger_id = (int) sess.getAttribute("user_id");
		int challengee_id = (int) sess.getAttribute("challengee_id");
		String questions_id = (String) sess.getAttribute("questions_id");
		int score1 = (int) sess.getAttribute("score1");
		int score2 = 0;
		int winner_id = 0;
		int completion = 0;
		challengedao.setChallenge(ch_id, challenger_id, challengee_id, questions_id, score1, score2, winner_id, completion);
		return "successfullychallenged";
	}
	
	@RequestMapping(value="startchallenge2.htm",method=RequestMethod.GET)
	public String startChallenge(HttpServletRequest request,Model model){
		
		String challengerName=request.getParameter("challengerName");
		model.addAttribute("challenger",getChallenger(challengerName));
		return "startquiz";
		
	}
	
	@RequestMapping(value="getChallenger.htm",method=RequestMethod.GET)
	public User getChallenger(String challengerName){
		return challengedao.getChallenger(challengerName);		
	}

	@RequestMapping(value="getWinner.htm",method=RequestMethod.GET)
	public String getWinner(HttpServletRequest request,@ModelAttribute("challenger") User challenger,Model model){
		HttpSession sess=request.getSession(false);
		if(sess!=null){
			int score=0;
			int userId = (Integer)sess.getAttribute("user_id");
			String winner=challengedao.getWinner(challenger.getUser_id(),userId,score);
			model.addAttribute("winner",winner);
			return "challengelist";
		}
		return "";
	}
}
