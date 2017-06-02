package servlet;

import util.Dbutil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Elrol on 2017/6/2.
 */
public class Delete_rerep extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String rereplayId = req.getParameter("rereplayId");
        if (rereplayId == null) {
            rereplayId = (String) req.getAttribute("replayId");
        }

        Dbutil db = new Dbutil();
        db.Delete("delete from rereplay where rereplayId=" + rereplayId);
        req.getRequestDispatcher("reply.jsp").forward(req,resp);
    }
}
