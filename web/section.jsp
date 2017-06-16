<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.sql.Timestamp" %>
<%@page language="java" import="java.util.*,util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    int startpoint = 0;
    int numberPerpage = 5;
    int currentPage = 1;
    int currentPoint = 0;
    String sectionName = null;

    if (request.getParameter("sectionName") != null) {
        sectionName = request.getParameter("sectionName");
    }

    if (request.getAttribute("sp") != null) {
        startpoint = (int) request.getAttribute("sp");
    }
    if (request.getAttribute("currentPage") != null) {
        currentPage = (int) request.getAttribute("currentPage");
    }
%>

<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <base href="<%=basePath%>">

    <title>Spring论坛 - Be Better</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/leave.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="leave-main">
    <div class="leave-main-body">
        <%
            String myusername = (String) session.getAttribute("username");
            int isAdmin = 0;
            int score = 0;
        %>
        <%
            if (myusername != null) {
                Dbutil db = new Dbutil();

                Users user = new Users();

                List<Users> list2 = db.select("select * from users where username='" + myusername + "'");
                user = list2.get(0);
                isAdmin = user.getIsAdmin();
                score = user.getScore();
                System.out.println(isAdmin);
                System.out.println(score);
            }

        %>
        <table>
            <tr>
                <td><a href="section.jsp?sectionName=Java">Java</a></td>
                <td><a href="section.jsp?sectionName=C">C</a></td>
                <td><a href="section.jsp?sectionName=C++">C++</a></td>
                <td><a href="section.jsp?sectionName=PHP">PHP</a></td>
                <td><a href="section.jsp?sectionName=Python">Python</a></td>
                <td><a href="section.jsp?sectionName=C#">C#</a></td>
                <td><a href="section.jsp?sectionName=JavaScript">JavaScript</a></td>
                <td><a href="section.jsp?sectionName=Visual Basic .Net">Visual Basic .Net</a></td>
                <td><a href="section.jsp?sectionName=Swift">Swift</a></td>
                <td><a href="section.jsp?sectionName=other">其他</a></td>
            </tr>
        </table>

        <div class="feed-list">

            <%

                Users us_top = new Users();
                Dbutil db = new Dbutil();
            %>

        </div>

        <div class="feed-list">

            <%

                Users us = new Users();


                List<Users> list = db.select1("select * from leavemessage where  tag='" + sectionName + "' limit " + startpoint + "," + numberPerpage + ";");
                for (int i = list.size() - 1; i >= 0; i--) {
                    us = list.get(i);
                    String username = us.getUsername();
                    String title = us.getTitle();
                    String leaveBody = us.getLeaveBody();
                    String leaveId = us.getId();
                    int repNum = us.getRepnum();
                    int isTop = us.getIsTop();
                    String tag = us.getTag();
                    Date post_time = (Date) us.getTime();
                    DateFormat post_dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            %>

            <div class="feed-item">
                <hr>
                <h2 class="feed-title"><a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %>
                </a> <%=tag%>
                </h2>
                <p class="feed-author"><%=username %>
                </p>
                <div class="feed-content">
                    <%=leaveBody %>
                    <p class="feed-time">回复数：<%=repNum %> 发表时间：<%=post_dateFormat.format(post_time) %>
                    </p>
                </div>
            </div>

            <%
                if (isAdmin == 1) {
                    out.print("<a href='delete?leaveId=" + leaveId + "' onclick='return isdelete()' >删除</a>");
                }
            %>

            <%
                if (isAdmin == 1 && isTop == 0) {
                    out.print("<a href='top?leaveId=" + leaveId + "' >置顶</a>");
                }
            %>

            <% }
                List<Users> list3 = db.select1("select * from leavemessage where  tag='" + sectionName + "';");
                int messageLength = list3.size();
                int pageNum = 0;
                if (messageLength % numberPerpage == 0) {
                    pageNum = messageLength / numberPerpage;
                } else {
                    pageNum = messageLength / numberPerpage + 1;
                }
            %>
            <br/>
            <p>总页数：<%=pageNum%>
            </p>
            <p>当前页数：<%=currentPage%>
            </p>
            <%if (currentPage != 1) {%>
            <a href="nextpage?startpoint=<%=startpoint%>&isNext=0&sectionName=<%=sectionName%>">上一页</a>
            <%
                }
                for (int i = 1; i <= pageNum; i++) {
                    currentPoint = numberPerpage * (i - 1);
            %>
            <a href="nextpage?startpoint=<%=currentPoint%>&sectionName=<%=sectionName%>"><%=i%>
            </a>
            <%
                }
                if (currentPage < pageNum) {
            %>
            <a href="nextpage?startpoint=<%=startpoint%>&isNext=1&sectionName=<%=sectionName%>">下一页</a>
            <%}%>
        </div>
    </div>
</div>
</body>
<script>
    function isdelete() {
        if (confirm("是否要删除？")) {
            return true;
        } else return false;
    }
</script>
</html>
