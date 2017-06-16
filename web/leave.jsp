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

<%
    String myusername=(String)session.getAttribute("username");
    int isAdmin=0;
    if(myusername!=null) {
        Dbutil db = new Dbutil();

        Users user = new Users();

        List<Users> list2 = db.select("select * from users where username='" + myusername + "'");
        user = list2.get(0);
        isAdmin = user.getIsAdmin();
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
          <!-- 置顶帖展示 -->
          <div class="feed-top">
            <div class="feed-top-field">
                <p>置顶区域</p>
            </div>
              <%
                  Users us_top =new Users();
                  Dbutil db2=new Dbutil();

                  List<Users> list_top =db2.select1("select * from leavemessage where isTop=1");
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
                  <p class="feed-author"><img src="img/post-name.png"> <%=username %></p>
                  <div class="feed-content">
                      <p><%=leaveBody %></p>
                      <p class="feed-time"><img src="img/post-repnum.png"> <%=repNum %>条回复 <img src="img/post-time.png"> <%=post_dateFormat.format(post_time) %></p>
                  </div>
                  <%if(isAdmin==1) {
                      out.print("<a href='delete?leaveId="+leaveId+"' onclick='return isdelete()' >删除</a>");
                  } %>

                  <%if(isAdmin==1&&isTop==1) {
                      out.print("<a href='cancelTop?leaveId="+leaveId+"' >取消置顶</a>");
                  } %>

              </div>
              <%   }%>

          </div>

          <!-- 帖子展示 -->
          <div class="feed-list">

    <%
	    
	    Users us=new Users();
	    

	    List<Users> list=db2.select1("select * from leavemessage where isTop=0 limit "+startpoint+","+numberPerpage+";" );
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
                  <p class="feed-author"><img src="img/post-name.png"> <%=username %></p>
                  <div class="feed-content">
                      <p><%=leaveBody %></p>
                      <p class="feed-time"><img src="img/post-repnum.png"> <%=repNum %>条回复 <img src="img/post-time.png"> <%=post_dateFormat.format(post_time) %></p>
                  </div>

              </div>

            <%if(isAdmin==1) {
            out.print("<a href='delete?leaveId="+leaveId+"' onclick='return isdelete()' >删除</a>");
            } %>

              <%if(isAdmin==1&&isTop==0) {
                  out.print("<a href='top?leaveId="+leaveId+"' >置顶</a>");
              } %>
              <hr>
   <% }%>


   <%
        List<Users> list3=db2.select1("select * from leavemessage where isTop=0;");
        int messageLength=list3.size();
        int pageNum=0;
        if(messageLength%numberPerpage==0){
            pageNum=messageLength/numberPerpage;
        }
        else {
            pageNum = messageLength / numberPerpage + 1;
        }
   %>
              <br/>
              <p>总页数：<%=pageNum%></p>
              <p>当前页数：<%=currentPage%></p>
              <%if(currentPage!=1){%>
              <a href="nextpage?startpoint=<%=startpoint%>&isNext=0">上一页</a>
              <%}
                for (int i=1;i<=pageNum;i++){
                  currentPoint=numberPerpage*(i-1);
              %>
              <a href="nextpage?startpoint=<%=currentPoint%>"><%=i%></a>
                <%}
                if(currentPage<pageNum){
              %>
              <a href="nextpage?startpoint=<%=startpoint%>&isNext=1">下一页</a>
              <%}%>
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
