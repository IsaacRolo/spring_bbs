package service;

import java.sql.Timestamp;

import util.Dbutil;

public class Message {
	Dbutil db = new Dbutil();
	String sql = "";

	public void leave(String username, String title, String leaveBody,
			Timestamp time) {

		db.Insert("insert into leaveMessage values('" + username + "',null,'"
				+ title + "','" + leaveBody + "',null,'" + time + "')");
	}

	public void reply(String replayusername, String replayBody, String leaveId,
			Timestamp rep_time) {
		db.Insert("insert into replay values(null,'" + replayusername + "','"
				+ replayBody + "','" + leaveId + "',+'" + rep_time + "');");

	}
}
