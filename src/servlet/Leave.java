package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.Message;
import service.UserService;
import util.Dbutil;

public class Leave extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		if (username == null || username.equals("")) {
			resp.sendRedirect("login.jsp");
			return;
		}
		String title = req.getParameter("title");
		String leaveId = req.getParameter("leaveId");
		String leaveBody = req.getParameter("leaveBody");
		String tag=req.getParameter("tag");
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Dbutil db = new Dbutil();
		Message mess = new Message();
		UserService userService = new UserService();
		userService.postSco(username);
		mess.leave(username, title, leaveBody, timeStamp,tag);
		resp.sendRedirect("leave.jsp");

	}

}
