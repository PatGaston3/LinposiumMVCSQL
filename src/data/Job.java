package data;
	
public class Job {
	private String employer;
	private String city;
	private String state;
	private String title;
	private String specialty;
	private String deadline;
	private String datePosted;
	private String website;
	private int id;

	public Job() {
	}
	
	public Job(int id, String employer, String city, String state, String title, String specialty, String deadline, String datePosted, String website) {
		this.id = id;
		this.employer = employer;
		this.city = city;
		this.state = state;
		this.title = title;
		this.specialty = specialty;
		this.deadline = deadline;
		this.datePosted = datePosted;
		this.website = website;
	}

	public String getEmployer() {
		return employer;
	}
	public String getCity() {
		return city;
	}
	public String getState() {
		return state;
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
	public int getId() {
		return id;
	}
	public String getWebsite() {
		return website;
	}

	public void setEmployer(String employer) {
		this.employer = employer;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setState(String state) {
		this.state = state;
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
	public void setId(int id) {
		this.id = id;
	}
	public void setWebsite(String website) {
		this.website = website;
	}

	@Override
	public String toString() {
		return "Job [employer=" + employer + ", city=" + city + ", title=" + title + "]";
	}

}
