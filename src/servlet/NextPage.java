package servlet;

import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NextPage extends HttpServlet {

	@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int numberPerpage=5;
		int startpoint = Integer.parseInt(req.getParameter("startpoint"));
		int isNext=2;
		String sectionName=null;
		if(req.getParameter("sectionName")!=null) {
			sectionName = req.getParameter("sectionName");
		}
		if(req.getParameter("isNext")!=null) {
			isNext = Integer.parseInt(req.getParameter("isNext"));
		}
		if(isNext==1) {
			startpoint += numberPerpage;
		}
		else if (isNext==0){
			startpoint-=numberPerpage;
		}
		int currentPage=startpoint/numberPerpage+1;

		req.setAttribute("sp",startpoint);
		req.setAttribute("currentPage", currentPage);
		if(sectionName==null) {
			req.getRequestDispatcher("leave.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("section.jsp").forward(req, resp);
		}

	}

}
