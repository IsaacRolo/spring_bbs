package servlet;

import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SaveInfo extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session=req.getSession();
		String id= (String) session.getAttribute("id");
		String psw=req.getParameter("savePsw");
		String email=req.getParameter("saveEmail");
		String sex=req.getParameter("sex");
		String intro=req.getParameter("intro");


		Dbutil db = new Dbutil();
		db.Delete("update users set password='"+psw+"',email='"+email+"',sex='"+sex+"',intro='"+intro+"' where id='" + id+"'");
		resp.sendRedirect("myInfo.jsp");

	}

}
