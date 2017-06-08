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
  <%String myusername=(String)session.getAttribute("username");
      int isAdmin=0;
      int score=0;%>
  <jsp:include page="header.jsp"></jsp:include>
  <div class="leave-main">
      <div class="leave-main-body">
          <!-- 置顶帖展示 -->
          <div class="feed-top">
            <div class="feed-top-field">
                <p>置顶区域</p>
            </div>
              <%

                  Users us_top =new Users();
                  Dbutil db=new Dbutil();

                  List<Users> list_top =db.select1("select * from leavemessage where isTop=1");
                  for(int i = list_top.size()-1; i >=0; i--){
                      us_top = list_top.get(i);
                      String username= us_top.getUsername();
                      String title= us_top.getTitle();
                      String leaveBody= us_top.getLeaveBody();
                      String leaveId= us_top.getId();
                      int repNum= us_top.getRepnum();
                      int isTop=us_top.getIsTop();
                      String tag=us_top.getTag();
                      Date post_time=(Date) us_top.getTime();
                      DateFormat post_dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              %>

              <div class="feed-item-top">
                  <p class="feed-tag">内容相关：<%=tag%></p>
                  <h2 class="feed-title"><img src="img/top.png"> <a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %>  </a></h2>
                  <p class="feed-author"><%=username %></p>
                  <div class="feed-content">
                      <p><%=leaveBody %></p>
                      <p class="feed-time"><%=repNum %>回复 发表时间：<%=post_dateFormat.format(post_time) %></p>
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

          <!-- 帖子展示 -->
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
	    String tag=us.getTag();
	    Date post_time=(Date)us.getTime();
        DateFormat post_dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    %>

              <div class="feed-item">
                  <p class="feed-tag">内容相关： <%=tag%></p>
                  <h2 class="feed-title"><a href="reply.jsp?leaveId=<%=leaveId%>"><%=title %> </a></h2>
                  <p class="feed-author"><%=username %></p>
                  <div class="feed-content">
                      <p><%=leaveBody %></p>
                      <p class="feed-time"><%=repNum %>回复 发表时间：<%=post_dateFormat.format(post_time) %></p>
                  </div>
                  <hr>
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
