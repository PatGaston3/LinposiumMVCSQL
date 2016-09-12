package data;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

public class JobDbDAO implements JobDAO {
	private static String url = "jdbc:mysql://localhost:3306/jobinfo";
	private static final String user = "stateuser";
	private static final String pword = "stateuser";


	public JobDbDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.err);
		}
	}

	@Override
	public List<Job> getJobsByEmployer(String employer) {
		List<Job> jobs = new ArrayList<>();
		employer = employer.toLowerCase();
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "SELECT id, name, city, state, title, specialty, deadline, dateposted, website FROM employer "
					+ "WHERE name = '" + employer + "'";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if (rs.getString(2).toLowerCase().contains(employer)) {
					Job newJob = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));

					jobs.add(newJob);
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			System.err.println(sqle);
		}
		return jobs;
	}


	@Override
	public List<Job> getJobs() {
		List<Job> jobs = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);

			String sqltxt;
			sqltxt = "SELECT id, name, city, state, title, specialty, deadline, dateposted, website FROM employer";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Job newJob = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));

				jobs.add(newJob);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			System.err.println(sqle);
		}
		return jobs;
	}

	@Override
	public void addJob(int id, String employer, String city, String state, String title, String specialty,
			String deadline, String datePosted, String website) {

		try {
		      Connection conn = DriverManager.getConnection(url, user, pword);
		      String sqltxt;
		      sqltxt = "INSERT INTO employer (id, name, city, state, title, specialty, deadline, datePosted, website ) "
		          + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		      PreparedStatement stmt = conn.prepareStatement(sqltxt, Statement.RETURN_GENERATED_KEYS);
		      stmt.setInt(1, id);
		      stmt.setString(2, employer);
		      stmt.setString(3, city);
		      stmt.setString(4, state);
		      stmt.setString(5, title);
		      stmt.setString(6, specialty);
		      stmt.setString(7, deadline);
		      stmt.setString(8, datePosted);
		      stmt.setString(9, website);
		      int uc = stmt.executeUpdate();
	
		    }
		    catch (SQLException sqle) {
		      sqle.printStackTrace(System.err);
		    }
		  }


	@Override
	public Job getJobById(int id) {
		Job j = null;
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);

			String sqltxt;
			sqltxt = "SELECT id, name, city, state, title, specialty, deadline, dateposted, website FROM employer WHERE id= ?";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if (Integer.parseInt(rs.getString(1)) == id) {
					j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException sqle) {
			System.err.println(sqle);
		}

		return j;
	}

	@Override
	public void removeJob(int num) {
		
		Connection conn = null;
		if (num > 0) {
			try {
				conn = DriverManager.getConnection(url, user, pword);
				String sqltxt;
				sqltxt = "DELETE FROM employer WHERE id = ?";
				PreparedStatement stmt = conn.prepareStatement(sqltxt);
				stmt.setInt(1, num);
				int uc = stmt.executeUpdate();
	
				stmt.close();
				conn.close();
			} catch (SQLException sqle) {
				try {
					conn.rollback();
				} catch (SQLException e) {
					System.err.println("Error rolling back transaction: " + e);
				}
				sqle.printStackTrace(System.err);
			}
		}

	}


	@Override
	public void updateJob(int id, String employer, String city, String state, String title, String specialty,
			String deadline, String datePosted, String website) {
		 try {
		      Connection conn = DriverManager.getConnection(url, user, pword);
		      String sqltxt;
		      
		      sqltxt = "UPDATE employer SET name = ?, city =?, state =?, title =?, specialty=?, deadline =?, dateposted =?, website = ?  "
		          + " WHERE id = ?";
		      PreparedStatement stmt = conn.prepareStatement(sqltxt);
		      stmt.setString(1, employer);
		      stmt.setString(2, city);
		      stmt.setString(3, state);
		      stmt.setString(4, title);
		      stmt.setString(5, specialty);
		      stmt.setString(6, deadline);
		      stmt.setString(7, datePosted);
		      stmt.setString(8, website);
		      stmt.setInt(9, id);
		      int uc = stmt.executeUpdate();
		      
		      stmt.close();
		      conn.close();
		    }
		    catch (SQLException sqle) {
		      sqle.printStackTrace(System.err);
		    }
		  }
	}