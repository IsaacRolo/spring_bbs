package servlet;

import service.Message;
import service.UserService;
import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

public class Replyre extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session=req.getSession();
		String username= (String) session.getAttribute("username");
		int replyId = Integer.parseInt(req.getParameter("replyId"));
		String replyName = req.getParameter("replyName");
		String replyBody = req.getParameter("replyBody");

		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		Dbutil db = new Dbutil();
		Message mess = new Message();
		UserService userService = new UserService();
		userService.rerepSco(username);
		mess.rereply(replyId, replyName,replyBody , timestamp);
		req.getRequestDispatcher("reply.jsp").forward(req, resp);
	}

}
