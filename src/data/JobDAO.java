package data;

import java.util.List;

public interface JobDAO {
	public List<Job> getJobsByEmployer(String employer);
	public List<Job> getJobsByLocation(String location);
	public List<Job> getJobsByTitle(String title);
	public List<Job> getJobsBySpecialty(String specialty);
	public List<Job> getJobs();
	void addJob(Job job);
	Job getJobById(double id);
	void removeJob(Job job);
	void updateJob(Job job, String employer, String location, String title, String specialty, String deadline, String datePosted);
}
