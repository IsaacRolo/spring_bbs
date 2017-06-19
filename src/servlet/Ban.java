package servlet;

import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ban extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");

		Dbutil db = new Dbutil();
		db.Delete("update users set score=0 where id='" + id+"'");
		resp.sendRedirect("manage.jsp");

	}

}
