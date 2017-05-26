package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
import util.Dbutil;

public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();
		if (username == null || username.equals("") || password == null
				|| password.equals("")) {
			resp.sendRedirect("index.jsp");
			return;
		}

		UserService us = new UserService();
		Dbutil db = new Dbutil();

		List list = us.login(username, password);

		if (list.size() > 0) {
			resp.sendRedirect("leave.jsp");
			session.setAttribute("username", username);
		} else {

			resp.sendRedirect("index.jsp");
			// HttpSession session1=req.getSession();
			// session1.setAttribute("username",username);
		}

	}

}
