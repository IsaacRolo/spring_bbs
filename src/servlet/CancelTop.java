package servlet;

import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CancelTop extends HttpServlet {

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
		db.Delete("update leavemessage set isTop=0 where leaveId='" + leaveId+"'");
		resp.sendRedirect("leave.jsp");

	}

}
