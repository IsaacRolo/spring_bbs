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

public class Reply extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String replayusername = (String) session.getAttribute("username");
		String replayBody = req.getParameter("replayBody");
		String leaveId = req.getParameter("leaveId");

		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		Dbutil db = new Dbutil();
		Message mess = new Message();
		UserService userService = new UserService();
		userService.repSco(replayusername);
		mess.reply(replayusername, replayBody, leaveId, timestamp);
		req.getRequestDispatcher("reply.jsp").forward(req, resp);

	}

}
