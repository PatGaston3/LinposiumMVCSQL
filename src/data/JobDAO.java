package data;

import java.sql.Date;
import java.util.List;

public interface JobDAO {
	public List<Job> getJobsByEmployer(String employer);
	public List<Job> getJobs();
	void addJob(int id, String employer, String city, String state, String title, String specialty, String deadline, String datePosted, String website);
	Job getJobById(int id);
	void removeJob(int num);
	void updateJob(int id, String employer, String city, String state, String title, String specialty, String deadline,
			String datePosted, String website);
}
