<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*,util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Spring论坛 - Be Better</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/leave.css">

  </head>
  
  <body>
        <div class="leave-main">
      <div class="leave-main-body">
        <h1>Spring论坛</h1>
        <%String myusername=(String)session.getAttribute("username"); %> 
        <%	    
        Dbutil db=new Dbutil();
	    
	    Users user=new Users();
	    
	    List<Users> list2=db.select("select * from users where username='"+myusername+"'");
	    user=list2.get(0);
	    int isAdmin=user.getIsAdmin();
	    int score=user.getScore();
	    System.out.println(isAdmin);
	    System.out.println(score);
	     %>
        <p>欢迎<%=myusername %>，您当前的积分为：<%=score %></p>
        <a href="post.jsp">发帖</a>

    
        <table>
          <tr>
            <td>帖子编号</td>
            <td>标题</td>
            <td>内容</td>
            <td>发帖人</td>
            <td>回复数</td>  
            <td>发帖时间</td> 
          </tr>
    <%
	    
	    Users us=new Users();
	    
	    
	    List<Users> list=db.select1("select * from leavemessage");
	    for(int i=0;i<list.size();i++){
	    us=list.get(i);
	    String username=us.getUsername();
	    String title=us.getTitle();
	    String leaveBody=us.getLeaveBody();
	    String leaveId=us.getId();
	    int repNum=us.getRepnum();
	    Date time=(Date)us.getTime();
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    %>
  <tr>
            <td><%=leaveId %></td>
            <td><a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %></a></td>
            <td><%=leaveBody %></td>
            <td><%=username %></td>
            <td><%=repNum %></td>
            <td><%=dateFormat.format(time) %></td>
            <%if(isAdmin==1) {
            out.print("<td><a href='delete?leaveId="+leaveId+"'>删除</a></td>");
            } %>
          </tr>
   <% }%>
    
    
     </table>
      </div>    
    </div>
  </body>
</html>
