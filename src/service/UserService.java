package service;

import java.util.List;

import util.Dbutil;
import util.Users;

public class UserService {
	Dbutil db = new Dbutil();
	String sql = "";

	public void Reg(String username, String password, String email) {
		sql = "insert into users values(null,'" + username + "','" + password
				+ "','" + email + "') ";
		db.Insert(sql);
	}

	public List login(String username, String password) {

		List list = db.select("select * from users where username='" + username
				+ "'and password='" + password + "'");

		return list;
	}

	public void postSco(String username) {
		Users user = new Users();
		List<Users> list2 = db.select("select * from users where username='"
				+ username + "'");
		user = list2.get(0);
		int score = user.getScore();
		score += 10;
		db.Insert("Update users set score='" + score + "' where username='"
				+ username + "'");
	}

	public void repSco(String username) {
		Users user = new Users();
		List<Users> list2 = db.select("select * from users where username='"
				+ username + "'");
		user = list2.get(0);
		int score = user.getScore();
		score += 1;
		db.Insert("Update users set score='" + score + "' where username='"
				+ username + "'");
	}
}
