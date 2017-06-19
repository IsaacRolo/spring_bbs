package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import util.Dbutil;

public class Reg extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out=resp.getWriter();
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String passwordt=req.getParameter("passwordt");
		String email=req.getParameter("email");
		
		UserService us=new UserService();
		Dbutil db=new Dbutil();
		
		
		if(!password.equals(passwordt)){
			resp.sendRedirect("reg.jsp");			
			return;
			
		}
		us.Reg(username, password, email);
		resp.sendRedirect("index.jsp");
		
		
	}

}
