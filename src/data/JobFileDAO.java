package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class JobFileDAO implements JobDAO {
	private static final String FILE_NAME="/WEB-INF/jobs.csv";
	private List<Job> jobs = new ArrayList<>();
	/*
	 * Use Autowired to have Spring inject an instance
	 * of a WebApplicationContext into this object after
	 * creation.  We will use the WebApplicationContext to
	 * retrieve a ServletContext so we can read from a 
	 * file.
	 */
	@Autowired 
	private WebApplicationContext wac;

	/*
	 * The @PostConstruct method is called by Spring after 
	 * object creation and dependency injection
	 */
	@PostConstruct
	public void init() {
		// Retrieve an input stream from the servlet context
		// rather than directly from the file system
		try (
				InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
			) {
			String line = buf.readLine();
			double id;
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split(" \\|");
				String employer = tokens[0];
				String location = tokens[1];
				String title = tokens[2];
				String specialty = tokens[3];
				String deadline = tokens[4];
				String datePosted = tokens[5];
				id = Math.random() * 1000;
//				String description = tokens[6];
				jobs.add(new Job(employer, location, title, specialty, deadline, datePosted, id));
			}
		} catch (Exception e) {
			System.err.println(e);
		}
	}

	@Override
	public List<Job> getJobs() {
		return jobs;
	}
	
	public void updateJob(Job job, String employer, String location, String title, String specialty, String deadline, String datePosted) {
		job.setEmployer(employer);
		job.setLocation(location);
		job.setTitle(title);
		job.setSpecialty(specialty);
		job.setDeadline(deadline);
		job.setDatePosted(datePosted);
	}
	
	@Override
	public Job getJobById(double id) {
		Job j = null;
		for (Job job : jobs) {
			if (job.getId() == id) {
				j = job;
			}
		}
		return j;
	}
	
	@Override
	public void removeJob(Job job) {
			jobs.remove(job);
	}
	
	
	
	@Override
	public List<Job> getJobsByEmployer(String employer) {
		employer = employer.toLowerCase();
		List<Job> employers = new ArrayList<>();
		for (Job job : jobs) {
			if (job.getEmployer().toLowerCase().contains(employer)) {
				employers.add(job);
			}
		}
		return employers;
	}
	
	@Override
	public List<Job> getJobsByLocation(String location) {
		location = location.toLowerCase();
		List<Job> locations = new ArrayList<>();
		for (Job job : jobs) {
			if (job.getLocation().toLowerCase().contains(location)) {
				locations.add(job);
			}
		}
		return locations;
	}
	
	@Override
	public List<Job> getJobsByTitle(String title) {
		title = title.toLowerCase();
		List<Job> titles = new ArrayList<>();
		for (Job job : jobs) {
			if (job.getTitle().toLowerCase().contains(title)) {
				titles.add(job);
			}
		}
		return titles;
	}

	@Override
	public List<Job> getJobsBySpecialty(String specialty) {
		specialty = specialty.toLowerCase();
		List<Job> specialties = new ArrayList<>();
		for (Job job : jobs) {
			if (job.getSpecialty().toLowerCase().contains(specialty)) {
				specialties.add(job);
			}
		}
		return specialties;
	}
	
	@Override
	public void addJob(Job job) {
		jobs.add(job);
		
	}


}

