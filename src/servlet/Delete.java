package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Dbutil;

public class Delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String leaveId = req.getParameter("leaveId");
		if (leaveId == null) {
			leaveId = (String) req.getAttribute("leaveId");
		}

		Dbutil db = new Dbutil();
		db.Delete("delete from leavemessage where leaveId=" + leaveId);
		resp.sendRedirect("leave.jsp");

	}

}
