package service;

import java.sql.Timestamp;

import util.Dbutil;

public class Message {
	Dbutil db = new Dbutil();
	String sql = "";

	public void leave(String username, String title, String leaveBody,
			Timestamp time,String tag) {

		db.Insert("insert into leaveMessage values('" + username + "',null,'"
				+ title + "','" + leaveBody + "',null,'" + time + "',null,'"+tag+"');");
	}

	public void reply(String replayusername, String replayBody, String leaveId,
			Timestamp rep_time) {
		db.Insert("insert into replay values(null,'" + replayusername + "','"
				+ replayBody + "','" + leaveId + "',+'" + rep_time + "');");

	}

	public void rereply(int replayId, String rereplayname, String rereplayBody,
			Timestamp rep_time) {
		db.Insert("insert into rereplay values(null,'" + replayId + "','"
				+ rereplayname + "','" + rereplayBody + "',+'" + rep_time + "');");

	}
}
