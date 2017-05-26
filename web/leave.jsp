<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*,util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="zh-CN">
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
        <p>欢迎<%if (isAdmin==1) {
            out.print("管理员");
        } else out.print("用户");%>  <%=myusername %>  ，您当前的积分为：<%=score %> <a href="post.jsp">发帖</a> </p>
          <div class="feed-list">

    <%
	    
	    Users us=new Users();
	    
	    
	    List<Users> list=db.select1("select * from leavemessage");
	    for(int i=list.size()-1;i > 0;i--){
	    us=list.get(i);
	    String username=us.getUsername();
	    String title=us.getTitle();
	    String leaveBody=us.getLeaveBody();
	    String leaveId=us.getId();
	    int repNum=us.getRepnum();
	    Date time=(Date)us.getTime();
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    %>

              <div class="feed-item">
                  <hr>
                  <h2 class="feed-title"><a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %></a></h2>
                  <p class="feed-author"><%=username %></p>
                  <div class="feed-content">
                      <%=leaveBody %>
                      <p class="feed-time">回复数：<%=repNum %>  发表时间：<%=dateFormat.format(time) %></p>
                  </div>
              </div>

            <%if(isAdmin==1) {
            out.print("<a href='delete?leaveId="+leaveId+"' onclick='return isdelete()' >删除</a>");
            } %>
   <% }%>
          </div>
      </div>    
    </div>
  </body>
<script>
    function isdelete() {
        if (confirm("是否要删除？")){
            return true;
        }else return false;
    }
</script>
</html>
