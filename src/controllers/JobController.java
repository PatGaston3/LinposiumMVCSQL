package controllers;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.Job;
import data.JobDAO;

@Controller
public class JobController {
	@Autowired
	private JobDAO jobDao;

	// GET ALL JOBS
	@RequestMapping(path = "GetJobs.do", params = "go", method = RequestMethod.GET)
	public ModelAndView getJobs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
	// GET JOBS BY EMPLOYER
	@RequestMapping(path = "GetJobs.do", params = "emp", method = RequestMethod.GET)
	public ModelAndView getByEmployer(@RequestParam("input") String a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		mv.addObject("jobs", jobDao.getJobsByEmployer(a));
		return mv;
	}

	
	// ADD JOB SCREEN
	@RequestMapping(path = "addJob.do", method = RequestMethod.GET)
	public ModelAndView addJob() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addJob.jsp");
		return mv;
	}
	
	// ADD JOB SCREEN
	@RequestMapping(path = "jobCompleted.do", method = RequestMethod.GET)
	public ModelAndView completeJob(@RequestParam("id") int num, 
									@RequestParam("employer") String employer, 
									@RequestParam("city") String city,
									@RequestParam("state") String state,
									@RequestParam("title") String title,
									@RequestParam("specialty") String specialty,
									@RequestParam("deadline") String deadline,
									@RequestParam("datePosted") String datePosted,
									@RequestParam("website") String website){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		jobDao.addJob(num, employer, city, state, title, datePosted, deadline, specialty, website);
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
	// UPDATE/EDIT OPTION SCREEN
	@RequestMapping(path = "editJob.do", method = RequestMethod.GET)
	public ModelAndView listJobs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editAll.jsp");
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
	// DELETE JOB
	@RequestMapping(path = "change.do", method = RequestMethod.GET)
	public ModelAndView editJob(@RequestParam("id") int num) {
		System.out.println("im here");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editAll.jsp");
		jobDao.removeJob(num);
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
	// UPDATE JOB INITIAL SCREEN
	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public ModelAndView updateJob(@RequestParam("id") int num) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateJob.jsp");
		mv.addObject("job", jobDao.getJobById(num));
		return mv;
	}
	
	// UPDATE JOB SCREEN
	@RequestMapping(path = "updatedJob.do", method = RequestMethod.GET)
	public ModelAndView doneJob(@RequestParam("id") int num, 
								@RequestParam("employer") String employer, 
								@RequestParam("city") String city,
								@RequestParam("state") String state,
								@RequestParam("title") String title,
								@RequestParam("specialty") String specialty,
								@RequestParam("deadline") String deadline,
								@RequestParam("datePosted") String datePosted,
								@RequestParam("website") String website){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		System.out.println(jobDao.getJobById(num));
		jobDao.updateJob(num, employer, city, state, title, specialty, deadline, datePosted, website);
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
	// CHECK PASSWORD SCREEN
	@RequestMapping(path = "checkPassword.do", method = RequestMethod.GET)
	public ModelAndView checkPassword(@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		if (password.equals("skilled")) {
			mv.setViewName("main.html");			
			return mv;
		}
		else {
			mv.setViewName("wrongPassword.html");
			return mv;
		}
	}
}
