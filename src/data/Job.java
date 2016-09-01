package data;

public class Job {
	private String employer;
	private String location;
	private String title;
	private String specialty;
	private String deadline;
	private String datePosted;
	private double id;
//	private String description;

	public Job() {
		this.id = Math.random() * 1000;
	}
	
	public Job(String employer, String location, String title, String specialty, String deadline, String datePosted, double id) {
		this.employer = employer;
		this.location = location;
		this.title = title;
		this.specialty = specialty;
		this.deadline = deadline;
		this.datePosted = datePosted;
		this.id = id;
//		this.description = description;
	}

	public String getEmployer() {
		return employer;
	}
	public String getLocation() {
		return location;
	}
	public String getTitle() {
		return title;
	}
	public String getSpecialty() {
		return specialty;
	}
	public String getDeadline() {
		return deadline;
	}
	public String getDatePosted() {
		return datePosted;
	}
	public double getId() {
		return id;
	}

	public void setEmployer(String employer) {
		this.employer = employer;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public void setDatePosted(String datePosted) {
		this.datePosted = datePosted;
	}
	public void setId(double id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Job [employer=" + employer + ", location=" + location + ", title=" + title + "]";
	}

}
