package servlet;

import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Delete_rep extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String replayId = req.getParameter("replayId");
		if (replayId == null) {
			replayId = (String) req.getAttribute("replayId");
		}

		Dbutil db = new Dbutil();
		db.Delete("delete from replay where replayId=" + replayId);
		req.getRequestDispatcher("reply.jsp").forward(req,resp);

	}

}
