package util;

import java.sql.Timestamp;

public class Users {
	private String username;
	private String password;
	private String title;
	private String id;
	private String leaveBody;
	private String email;
	private String replyBody;
	private int repnum;
	private Timestamp time;
	private Timestamp rep_time;
	private int isAdmin;
	private int score;

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Timestamp getRep_time() {
		return rep_time;
	}

	public void setRep_time(Timestamp rep_time) {
		this.rep_time = rep_time;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int getRepnum() {
		return repnum;
	}

	public void setRepnum(int repnum) {
		this.repnum = repnum;
	}

	public String getReplyBody() {
		return replyBody;
	}

	public void setReplyBody(String replyBody) {
		this.replyBody = replyBody;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLeaveBody() {
		return leaveBody;
	}

	public void setLeaveBody(String leaveBody) {
		this.leaveBody = leaveBody;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}