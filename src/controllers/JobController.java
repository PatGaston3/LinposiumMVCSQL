package controllers;

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
	
	// GET JOBS BY LOCATION
	@RequestMapping(path = "GetJobs.do", params = "loc", method = RequestMethod.GET)
	public ModelAndView getByLocation(@RequestParam("input") String a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		mv.addObject("jobs", jobDao.getJobsByLocation(a));
		return mv;
	}
	
	// GET JOBS BY TITLE
	@RequestMapping(path = "GetJobs.do", params = "tit", method = RequestMethod.GET)
	public ModelAndView getByTitle(@RequestParam("input") String a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		mv.addObject("jobs", jobDao.getJobsByTitle(a));
		return mv;
	}
	
	// GET JOBS BY SPECIALTY
	@RequestMapping(path = "GetJobs.do", params = "spec", method = RequestMethod.GET)
	public ModelAndView getBySpecialty(@RequestParam("input") String a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		mv.addObject("jobs", jobDao.getJobsBySpecialty(a));
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
	public ModelAndView completeJob(Job j) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		jobDao.addJob(j);
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
	public ModelAndView editJob(@RequestParam("id") double num) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editAll.jsp");
		jobDao.removeJob(jobDao.getJobById(num));
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
	// UPDATE JOB INITIAL SCREEN
	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public ModelAndView updateJob(@RequestParam("id") double num) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateJob.jsp");
		mv.addObject("job", jobDao.getJobById(num));
		return mv;
	}
	
	// UPDATE JOB SCREEN
	@RequestMapping(path = "updatedJob.do", method = RequestMethod.GET)
	public ModelAndView doneJob(@RequestParam("id") double num, 
								@RequestParam("employer") String employer, 
								@RequestParam("location") String location,
								@RequestParam("title") String title,
								@RequestParam("specialty") String specialty,
								@RequestParam("deadline") String deadline,
								@RequestParam("datePosted") String datePosted,
								@RequestParam("website") String website){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultAll.jsp");
		jobDao.updateJob(jobDao.getJobById(num), employer, location, title, specialty, deadline, datePosted, website);
		mv.addObject("jobs", jobDao.getJobs());
		return mv;
	}
	
}
