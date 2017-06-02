package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Dbutil {
	Connection conn;
	Statement stmt;
	List list;
	String url = /* "jdbc:oracle:thin:@localhost:1521:XE"; */"jdbc:mysql://localhost:3306/bbs_test?useUnicode=true&characterEncoding=UTF-8";
	String driver = /* "oracle.jdbc.driver.OracleDriver"; */"com.mysql.jdbc.Driver";
	String dbname = /* "bbs"; */"root";
	String dbpwd = /* "123"; */"12345678";

	public void getConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbname, dbpwd);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public List select(String sql) {
		getConn();

		try {
			stmt = conn.createStatement();
			// int rs=stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);

			list = new ArrayList();
			while (rs.next()) {
				Users stu = new Users();
				stu.setUsername(rs.getString(2));
				/* System.out.println("-----------------------"); */
				stu.setPassword(rs.getString(3));
				stu.setIsAdmin(rs.getInt(5));
				stu.setScore(rs.getInt(6));
				list.add(stu);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	public Statement Insert(String sql) {
		getConn();

		try {
			System.out.println(sql);
			stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);

			close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return stmt;

	}

	/**
	 * 帖子相关的查询，表对应leavemessage表
	 */
	public List select1(String sql) {
		getConn();

		try {
			stmt = conn.createStatement();
			// int rs=stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);

			list = new ArrayList();
			while (rs.next()) {
				Users stu = new Users();
				stu.setId(rs.getString(2));
				stu.setUsername(rs.getString(1));
				stu.setTitle(rs.getString(3));
				stu.setLeaveBody(rs.getString(4));
				stu.setRepnum(rs.getInt(5));
				stu.setTime(rs.getTimestamp(6));
				stu.setIsTop(rs.getInt(7));
				stu.setTag(rs.getString(8));
				list.add(stu);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List select2(String sql) {
		getConn();

		try {
			stmt = conn.createStatement();
			// int rs=stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);

			list = new ArrayList();
			while (rs.next()) {
				Users stu = new Users();
				stu.setId(rs.getString(1));
				stu.setUsername(rs.getString(2));

				stu.setReplyBody(rs.getString(3));
				stu.setRep_time(rs.getTimestamp(5));

				list.add(stu);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	public List select3(String sql) {
		getConn();

		try {
			stmt = conn.createStatement();
			// int rs=stmt.executeUpdate(sql);
			ResultSet rs = stmt.executeQuery(sql);

			list = new ArrayList();
			while (rs.next()) {
				Rereply rereply = new Rereply();
				rereply.setRereplayId(rs.getInt(1));
				rereply.setReplayId(rs.getInt(2));
				rereply.setRereplayname(rs.getString(3));
				rereply.setRereplayBody(rs.getString(4));
				rereply.setRep_time(rs.getTimestamp(5));

				list.add(rereply);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Statement Delete(String sql) {
		getConn();

		try {
			System.out.println(sql);
			stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);

			close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return stmt;

	}

	public void close() throws SQLException {

		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}

	}

}
