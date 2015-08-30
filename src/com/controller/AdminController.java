package com.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.AdminDao;
import com.entity.Category;
import com.entity.Challenge;
import com.entity.QuestionBank;
import com.entity.RuntimeScore;
import com.entity.ScoreCard;
import com.entity.User;


@Controller
public class AdminController {

	@Autowired
	AdminDao adminDao;
	
	

	@RequestMapping(value="viewcat.htm", method=RequestMethod.GET)
	public String displaycatform(HttpServletRequest request,Model model){
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		model.addAttribute("category", new Category());
		if(adminDao.getCats().size()==0)
		return "zerocat";
		
		model.addAttribute("dlist", adminDao.getCats());
		
		
		return "catform";
	}
	@RequestMapping(value="quiz.htm" ,method=RequestMethod.POST)
	public String processCatFrm(@ModelAttribute("category") Category c1, Model model, HttpSession session,HttpServletRequest request){
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		List<QuestionBank> lst=adminDao.viewQuestionByCat(c1.getCategory_name());
		if(lst.size()==0){
			return "zeroques";
		}
		session.setAttribute("elist",lst);
		
		
		return "arpit";
	}


	@RequestMapping(value="viewscore.htm" ,method=RequestMethod.POST)
	public String addtFrm(Model model,HttpServletRequest request,HttpSession session){
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		ArrayList<RuntimeScore> rs=new ArrayList<RuntimeScore>();
		Enumeration<String> cnames=request.getParameterNames();
		while (cnames.hasMoreElements()) {
			String cname = (String) cnames.nextElement();
			
			
				String cvalue=request.getParameter(cname);
				System.out.println(cname+"\t"+cvalue);
				
				rs.add(new RuntimeScore(Integer.parseInt(cname), Integer.parseInt(cvalue), 3));
			
		}
		
		
		
		
		
	
		model.addAttribute("rs",rs);
		return "scorecard";
	}
	@RequestMapping(value="viewscore1.htm" ,method=RequestMethod.POST)
	public String additiFrm(Model model,HttpServletRequest request,HttpSession session){
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		ArrayList<RuntimeScore> rs=new ArrayList<RuntimeScore>();
		Enumeration<String> cnames=request.getParameterNames();
		while (cnames.hasMoreElements()) {
			String cname = (String) cnames.nextElement();
			
			
				String cvalue=request.getParameter(cname);
				System.out.println(cname+"\t"+cvalue);
				
				rs.add(new RuntimeScore(Integer.parseInt(cname), Integer.parseInt(cvalue), 3));
			
		}
		
		
	
		
		
	
		model.addAttribute("rs",rs);
		return "scorecard1";
	}
	@RequestMapping(value="viewscore12.htm" ,method=RequestMethod.POST)
	public String additFrm(Model model,HttpServletRequest request,HttpSession session){
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		ArrayList<RuntimeScore> rs=new ArrayList<RuntimeScore>();
		Enumeration<String> cnames=request.getParameterNames();
		while (cnames.hasMoreElements()) {
			String cname = (String) cnames.nextElement();
			
			
				String cvalue=request.getParameter(cname);
				System.out.println(cname+"\t"+cvalue);
				
				rs.add(new RuntimeScore(Integer.parseInt(cname), Integer.parseInt(cvalue), 3));
			
		}
		
		
	
		
		
	
		model.addAttribute("rs",rs);
		return "scorecard12";
	}
	
	
	@RequestMapping(value="process1.htm",   method=RequestMethod.GET)
	public String allQuesForm(Model model,@RequestParam("score") int score,HttpSession session) {
		int id=adminDao.getMax1();
		/*ScoreCard sc=new ScoreCard();
		//sc.setScore(score);
		sc.setTimestamp("anmol");
		sc.setS_id(id+1);
		ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
		
			list=(ArrayList<QuestionBank>)session.getAttribute("elist");
			
		sc.setCategory_name(adminDao.getCat(list.get(0).getCategory_id()));
		sc.setUser_id((Integer)session.getAttribute("user_id"));
		sc.setScore(score);*/
		Challenge c=new Challenge();
		c.setChallenge_id(id+1);
		c.setChallenger_id((Integer)session.getAttribute("user_id"));
		c.setChallengee_id((Integer)session.getAttribute("challengee_id"));
		c.setScore1(score);
		c.setQuestions_id((String)session.getAttribute("quesstring"));
		c.setCompletion(0);
		adminDao.saveemp1(c);
		
		return "redirect:Challenge.htm";
	}

	@RequestMapping(value="process13.htm",   method=RequestMethod.GET)
	public String allQuesFormu(Model model,@RequestParam("score") int score,HttpSession session) {
		int id=(Integer)session.getAttribute("challengeid");
		/*ScoreCard sc=new ScoreCard();
		//sc.setScore(score);
		sc.setTimestamp("anmol");
		sc.setS_id(id+1);
		ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
		
			list=(ArrayList<QuestionBank>)session.getAttribute("elist");
			
		sc.setCategory_name(adminDao.getCat(list.get(0).getCategory_id()));
		sc.setUser_id((Integer)session.getAttribute("user_id"));
		sc.setScore(score);*/
		Challenge c=adminDao.getchallenge(id);
		
		
		c.setScore2(score);
		if(score>c.getScore1())
			c.setWinner_id(c.getChallengee_id());
		else if(c.getScore1()>score)
			c.setWinner_id(c.getChallenger_id());
		else
			c.setWinner_id(-1);
		c.setCompletion(1);
		adminDao.updateemp1(c);
		
		return "redirect:Challenge.htm";
	}
	
	@RequestMapping(value="process12.htm",   method=RequestMethod.GET)
	public String allQuesFormi(Model model,HttpServletRequest request,@RequestParam("quesstring") String quesstring,@RequestParam("challenge_id") int challenge_id,HttpSession session) {
	
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		List<QuestionBank> lst=new ArrayList<QuestionBank>();
		String arr[]=quesstring.split("-");
		for(String s:arr){
		int id=Integer.parseInt(s);
		QuestionBank q=adminDao.getq(id);
		lst.add(q);
		}
		session.setAttribute("challengeid", challenge_id);
		System.out.println("***************list hai**********"+lst);
		session.setAttribute("elist", lst);
		/*ScoreCard sc=new ScoreCard();
		//sc.setScore(score);
		sc.setTimestamp("anmol");
		sc.setS_id(id+1);
		ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
		
			list=(ArrayList<QuestionBank>)session.getAttribute("elist");
			
		sc.setCategory_name(adminDao.getCat(list.get(0).getCategory_id()));
		sc.setUser_id((Integer)session.getAttribute("user_id"));
		sc.setScore(score);*/
	
		
		return "arpit3";
	}

	@RequestMapping(value="process.htm",   method=RequestMethod.GET)
	public String allQuesiForm(Model model,@RequestParam("score") int score,HttpSession session) {
		int id=adminDao.getMax();
		ScoreCard sc=new ScoreCard();
		//sc.setScore(score);
		sc.setTimestamp("anmol");
		sc.setS_id(id+1);
		System.out.println("score is"+score);
		ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
		
			list=(ArrayList<QuestionBank>)session.getAttribute("elist");
			
		sc.setCategory_name(adminDao.getCat(list.get(0).getCategory_id()));
		sc.setUser_id((Integer)session.getAttribute("user_id"));
		sc.setScore(score);
		/*Challenge c=new Challenge();
		c.setChallenge_id(id+1);
		c.setChallenger_id((Integer)session.getAttribute("user_id"));
		c.setChallengee_id((Integer)session.getAttribute("challengee_id"));
		c.setScore1(score);
		c.setQuestions_id((String)session.getAttribute("quesstring"));
		c.setCompletion(false);
		adminDao.saveemp1(c);
		*/
		adminDao.saveemp(sc);
		return "redirect:viewcat.htm";
	}


	
	
	
	
	
	
	
	@RequestMapping(value="addQues.htm",method=RequestMethod.GET)
	public String showQuesForm(Model model,HttpServletRequest request) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		model.addAttribute("category", new Category());
		if(adminDao.getCats().size()==0)
		return "zerocat1";
		System.out.println(adminDao.getCats());
		model.addAttribute("dlist", adminDao.getCats());
		return "catform2";
	}
	
	@RequestMapping(value="ques.htm" ,method=RequestMethod.POST)
	public String processiCatFrm(@ModelAttribute("category") Category c1, Model model, HttpSession session,HttpServletRequest request){
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		System.out.println(c1.getCategory_id());
		int id=adminDao.getCati(c1.getCategory_name());
		session.setAttribute("cat",id);
		
		
		
		return "AddQuestion";
	}
	
	
	
	@RequestMapping(value="add.htm",method=RequestMethod.POST)
	public String addQuestion(HttpServletRequest request,Model model) 
	{
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		QuestionBank q = new QuestionBank();
		int ques_id =adminDao.maxKey("QuestionBank","ques_id")+1;
		q.setQues_id(ques_id);
		System.out.println((Integer)request.getSession().getAttribute("cat"));
		q.setCategory_id((Integer)request.getSession().getAttribute("cat"));
		q.setOption1(request.getParameter("option1"));
		q.setOption2(request.getParameter("option2"));
		q.setOption3(request.getParameter("option3"));
		q.setOption4(request.getParameter("option4"));
		q.setQuestion(request.getParameter("question"));
		q.setRight_answer(Integer.parseInt(request.getParameter("right_answer")));
		q.setQues_audio(null);
		q.setQues_image(null);
		int i=adminDao.addQues(q);
		model.addAttribute("success_entry",i);
		return "Admin_Console";
	}
	
	@RequestMapping(value="showQues.htm",method=RequestMethod.GET)
	public String showQuesEntry(Model model,HttpServletRequest request) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		return "showQues";
	}
	
	
	/*@RequestMapping(value="show.htm",method=RequestMethod.POST)
	public String showQuestion(HttpServletRequest request,Model model) {
		int ques_id=Integer.parseInt(request.getParameter("ques_id"));
		QuestionBank q = adminDao.showQues(ques_id);
		model.addAttribute("cat_id",q.getCategory_id());
		model.addAttribute("question",q.getQuestion());
		model.addAttribute("option1",q.getOption1());
		model.addAttribute("option2",q.getOption2());
		model.addAttribute("option3",q.getOption3());
		model.addAttribute("option4",q.getOption4());
		model.addAttribute("right_answer",q.getRight_answer());	
		return "successful_show";
	}
	*/
	
	
	@RequestMapping(value="modifyQues.htm",method=RequestMethod.GET)
	public String modifyQuesEntry(Model model,HttpServletRequest request) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		
		model.addAttribute("question", new QuestionBank());
		if(adminDao.getquestions().size()==0)
		return "zeroques1";
		
		model.addAttribute("dlist", adminDao.getquestions());
		
		
		return "quesform";
		
		/*return "ModifyQuestion";*/
	}
	
	
	@RequestMapping(value="show1.htm",method=RequestMethod.POST)
	public String modifyshowQuestion(HttpServletRequest request,@ModelAttribute("question") QuestionBank q1,Model model) {
		//int ques_id=Integer.parseInt(request.getParameter("ques_id"));
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		
		
		QuestionBank q = adminDao.showQues(q1.getQuestion());
		model.addAttribute("ques_id",q.getQues_id());
		model.addAttribute("cat_id",q.getCategory_id());
		model.addAttribute("question",q.getQuestion());
		model.addAttribute("option1",q.getOption1());
		model.addAttribute("option2",q.getOption2());
		model.addAttribute("option3",q.getOption3());
		model.addAttribute("option4",q.getOption4());
		model.addAttribute("right_answer",q.getRight_answer());	
		return "ModifyCurrentQuestion";
	}
	
	
	
	@RequestMapping(value="mod.htm",method=RequestMethod.POST)
	public String modifyQuestion(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		/*int category_id = Integer.parseInt(request.getParameter("category_id"));*/
		int ques_id = Integer.parseInt(request.getParameter("ques_id"));
		String question=request.getParameter("question");
		String option1=request.getParameter("option1");
		String option2=request.getParameter("option2");
		String option3=request.getParameter("option3");
		String option4=request.getParameter("option4");
		int right_answer = Integer.parseInt(request.getParameter("right_answer"));
		int success = adminDao.modifyQues(ques_id, question, option1, option2, option3, option4, right_answer);
		model.addAttribute("success_modify",success);
		return "Admin_Console";
	}
	
	
	@RequestMapping(value="deleteQues.htm",method=RequestMethod.GET)
	public String deleteQuesEntry(Model model,HttpServletRequest request) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		return "deleteQues";
	}
	
	@RequestMapping(value="home.htm",method=RequestMethod.GET)
	public String home(Model model) {
		
		return "Admin_Console";
	}
	
	
	@RequestMapping(value="delete.htm",method=RequestMethod.POST)
	public String deleteQuestion(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		int ques_id = Integer.parseInt(request.getParameter("ques_id"));
		int success = adminDao.deleteQues(ques_id);
		model.addAttribute("success_delete",success);
		return "successful_delete";
	}
	
	@RequestMapping(value="addCat.htm",method=RequestMethod.GET)
	public String addCat(Model model,HttpServletRequest request) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		return "addCat";
	}
	
	
	@RequestMapping(value="Cat.htm",method=RequestMethod.POST)
	public String addCategory(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		
		int category_id =adminDao.maxKey("Category","category_id")+1;
		String category_name=request.getParameter("category_name");
		String category_logo=request.getParameter("category_logo");
		String category_desc=request.getParameter("category_desc");
		int success = adminDao.addCategory(category_id,category_name, category_logo,  category_desc);
		model.addAttribute("success_cat_add",success);
		return "Admin_Console";
	}
	
	@RequestMapping(value="showCat.htm",method=RequestMethod.GET)
	public String showCat(Model model,HttpServletRequest request) {
		
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		List<String> lst = adminDao.showCat();
		model.addAttribute("List",lst);
		return "showCategory";
	}
	
	@RequestMapping(value="showQuesinCat.htm",method=RequestMethod.POST)
	public String showQuesinCat(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:admin_login.htm";
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		List<QuestionBank> q = adminDao.allQuesInCat(category_id);
		model.addAttribute("allQues", q);
		return "successful_ques_cat_show";
	}
	
	
	@RequestMapping(value="Challenge.htm",method=RequestMethod.GET)
	public String showIQuesinCat(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		model.addAttribute("category", new Category());
		if(adminDao.getCats().size()==0)
		return "zerocat";
		
		model.addAttribute("dlist", adminDao.getCats());
		/*model.addAttribute("user", new User());
		if(adminDao.getusers().size()==0)
			return "zerouser";
			
			model.addAttribute("elist", adminDao.getusers());*/
		
		
		return "catform3";
		/*return "zerochal";*/
	}
	
	@RequestMapping(value="viewusers.htm",method=RequestMethod.POST)
	public String showfIQuesinCat(@ModelAttribute("category") Category c1,HttpSession session,HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
	/*	model.addAttribute("category", new Category());
		if(adminDao.getCats().size()==0)
		return "zerocat";
		
		model.addAttribute("dlist", adminDao.getCats());*/
		session.setAttribute("categoryhai", c1.getCategory_name());
		model.addAttribute("user", new User());
		if(adminDao.getusers((Integer)session.getAttribute("user_id")).size()==0)
			return "zerouser";
			
			model.addAttribute("elist", adminDao.getusers((Integer)session.getAttribute("user_id")));
		
		
		return "chalform";
		/*return "zerochal";*/
	}
	@RequestMapping(value="ViewScoreboard.htm",method=RequestMethod.GET)
	public String showkIQuesinCat(HttpServletRequest request,Model model,HttpSession session) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		int id=(Integer)session.getAttribute("user_id");
		List<Challenge> lst=adminDao.getthrownchallenges(id);
		System.out.println(lst);
		List<Challenge> lst2=adminDao.getreceivechallenges(id);
		System.out.println(lst2);
		model.addAttribute("thrown", lst);
model.addAttribute("receive", lst2);
		return "mychallenge";
	}
	
	@RequestMapping(value="ProfileView.htm",method=RequestMethod.GET)
	public String showkkIQuesinCat(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		HttpSession sess=request.getSession();
		int id=(Integer)sess.getAttribute("user_id");
		User user=adminDao.getuser(id);
		model.addAttribute("userid", user.getUser_id());
		model.addAttribute("username", user.getUsername());
		model.addAttribute("first", user.getFirst_name());
		model.addAttribute("last", user.getLast_name());
		model.addAttribute("email", user.getEmail());
		model.addAttribute("password", user.getPassword());
		model.addAttribute("profilepic", user.getProfile_pic());
		return "profileview";
		
		/*return "zeroprof";*/
		
	}
	@RequestMapping(value="insertprof.htm",method=RequestMethod.POST)
	public String modifyiQuestion(HttpServletRequest request,Model model) {
		if(request.getSession(false).getAttribute("flag")==null)
			return "redirect:reg.htm";
		/*int category_id = Integer.parseInt(request.getParameter("category_id"));*/
		int user_id = Integer.parseInt(request.getParameter("userid"));
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		
		int success = adminDao.modifyuser(user_id, email, password);
		model.addAttribute("success_modify",success);
		return "User_Console";
	}
	
}
