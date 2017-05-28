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
        <p>欢迎 <em><%if (isAdmin==1) {
            out.print("管理员");
        } else out.print("用户");%></em>  <%=myusername %>  ，您当前的积分为：<em><%=score %></em> <a href="post.jsp">发帖</a><a href="index.jsp">  退出登录</a> </p>

          <div class="feed-list">

              <%

                  Users us_top =new Users();


                  List<Users> list_top =db.select1("select * from leavemessage where isTop=1");
                  for(int i = list_top.size()-1; i >=0; i--){
                      us_top = list_top.get(i);
                      String username= us_top.getUsername();
                      String title= us_top.getTitle();
                      String leaveBody= us_top.getLeaveBody();
                      String leaveId= us_top.getId();
                      int repNum= us_top.getRepnum();
                      int isTop=us_top.getIsTop();
                      Date post_time=(Date) us_top.getTime();
                      DateFormat post_dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              %>

              <div class="feed-item">
                  <hr>
                  <h2 class="feed-title">置顶</h2>
                  <h2 class="feed-title"><a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %></a></h2>
                  <p class="feed-author"><%=username %></p>
                  <div class="feed-content">
                      <%=leaveBody %>
                      <p class="feed-time">回复数：<%=repNum %> 发表时间：<%=post_dateFormat.format(post_time) %></p>
                  </div>
              </div>

              <%if(isAdmin==1) {
                  out.print("<a href='delete?leaveId="+leaveId+"' onclick='return isdelete()' >删除</a>");
              } %>

              <%if(isAdmin==1&&isTop==1) {
                  out.print("<a href='cancelTop?leaveId="+leaveId+"' >取消置顶</a>");
              } %>
              <% }%>
          </div>

          <div class="feed-list">

    <%
	    
	    Users us=new Users();
	    
	    
	    List<Users> list=db.select1("select * from leavemessage");
	    for(int i=list.size()-1;i >= 0;i--){
	    us=list.get(i);
	    String username=us.getUsername();
	    String title=us.getTitle();
	    String leaveBody=us.getLeaveBody();
	    String leaveId=us.getId();
	    int repNum=us.getRepnum();
	    int isTop=us.getIsTop();
	    Date post_time=(Date)us.getTime();
        DateFormat post_dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    %>

              <div class="feed-item">
                  <hr>
                  <h2 class="feed-title"><a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %></a></h2>
                  <p class="feed-author"><%=username %></p>
                  <div class="feed-content">
                      <%=leaveBody %>
                      <p class="feed-time">回复数：<%=repNum %> 发表时间：<%=post_dateFormat.format(post_time) %></p>
                  </div>
              </div>

            <%if(isAdmin==1) {
            out.print("<a href='delete?leaveId="+leaveId+"' onclick='return isdelete()' >删除</a>");
            } %>

              <%if(isAdmin==1&&isTop==0) {
                  out.print("<a href='top?leaveId="+leaveId+"' >置顶</a>");
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
