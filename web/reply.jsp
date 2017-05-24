<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*,util.*,service.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Spring论坛 - Be Better</title>
    <meta charset="utf-8">
	  <meta http-equiv="pragma" content="no-cache">
	  <meta http-equiv="cache-control" content="no-cache">
	  <meta http-equiv="expires" content="0">    
	  <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/reply.css">
  </head>
  
  <body>  
	        <%
  String leaveId=request.getParameter("leaveId");
  if(leaveId==null){
  leaveId=(String)request.getAttribute("leaveId");
 }
 Dbutil db=new Dbutil();
 Message mess=new Message();
  List list=db.select1("select * from leaveMessage where leaveId="+leaveId);
  for(int i=0;i<list.size();i++){
     Users m=new Users();
     m=(Users)list.get(i);    
   String Id=m.getId();
   String title=m.getTitle();
   String username=m.getUsername();
   String leaveBody=m.getLeaveBody();
    %>
    <div class="reply-main">
      <div class="reply-main-body">
        <h1>Spring论坛</h1>
        <p>欢迎用户<a href="#"><%=session.getAttribute("username") %></a></p>
        <hr/>   

        <table>
          <tr>
            <td>帖子编号</td>
            <td>标题</td>
            <td>内容</td>
            <td>楼主</td>
          </tr>
          <tr>
            <td><%=Id %></td>
            <td><%=title %></td>
            <td><%=leaveBody %></td>
            <td><%=username%></td>
          </tr>
        </table>
        <%} %>
        <hr/>
        <table>
          <tr>
            <td>回复编号</td>
            <td>内容</td>
            <td>回复人</td>
            <td>帖子编号</td>
            <td>回复时间</td>
          </tr>
          <%!int num=0; %>
          <%
           List<Users> list1=db.select2("select * from replay where leaveId="+leaveId);
            Dbutil db1=new Dbutil();
           Message mess1=new Message();
          /* System.out.println(list1.toString());
           System.out.println("-----------------");*/
           for(int i=0;i<list1.size();i++){
          Users m1=new Users();
           m1=(Users)list1.get(i);
           String replayId=m1.getId();
           String replayBody=m1.getReplyBody();
           String replayname=m1.getUsername();
           Date timestamp=(Date)m1.getRep_time();
           DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           System.out.println(dateFormat.format(timestamp));
           System.out.println(replayBody);
           num=i+1;
           
           %>
          <tr>
            <td><%=i+1 %>楼</td>
            <td><%=replayBody %></td>
            <td><%=replayname %></td>
            <td><%=leaveId %></td>
            <td><%=dateFormat.format(timestamp) %></td>
          </tr>
          <%}
          System.out.println(num);
          db.Insert("update leavemessage set repnum="+num+" where leaveId="+leaveId);
          num=0;
          %>
        </table>
        <hr/>
   
        <form action="reply" method="post"> 
          <label>回复内容</label><br/>
          <textarea rows="5" cols="100" name="replayBody"></textarea><br/>
          <input  type="hidden"  value="<%=leaveId%>"  name="leaveId"/> 
          <button  type="submit" class="reply-button"  name="fabiao" />发表回复</button>
        </form>
      </div>
    </div>
    
  </body>
</html>