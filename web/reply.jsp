<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<@page import="java.sql.Timestamp" %>
<%@ page language="java" import="java.util.*,util.*,service.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();


    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String uname= (String) session.getAttribute("username");


%>
<!DOCTYPE HTML>
<html lang="zh-CN">
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

    Dbutil db = new Dbutil();
    Message mess = new Message();

    List list = db.select1("select * from leaveMessage where leaveId=" + leaveId);



    Users m=new Users();
    m=(Users)list.get(0);
    String Id=m.getId();
    String title=m.getTitle();
    String username=m.getUsername();
    String leaveBody=m.getLeaveBody();


%>
<div class="reply-main">
    <div class="reply-main-body">
        <h1>Spring论坛</h1>

        <%if(uname!=null){%>
        <p>欢迎用户<a href="#"><%=uname %>
        </a><a href="index.jsp"> 退出</a></p>
        <%}else{
            out.print("欢迎游客,登录后即可回复");
        }%>

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

        <hr/>
        <table>
            <tr>
                <td>回复编号</td>
                <td>内容</td>
                <td>回复人</td>
                <td>帖子编号</td>
                <td>回复时间</td>
            </tr>

            <%!int num = 0; %>
            <%

                List<Users> list1 = db.select2("select * from replay where leaveId=" + leaveId);


                Dbutil db1 = new Dbutil();
                Message mess1 = new Message();

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

                <td><%=i + 1 %>楼</td>
                <td><%=replayBody %>
                </td>
                <td><%=replayname %>
                </td>
                <td><%=leaveId %>
                </td>
                <td><%=dateFormat.format(timestamp) %>
                </td>
                <%

                    if (uname!=null){
                        if (uname.equals(username)) {
                        out.print("<td><a href='delete_rep?replayId=" + replayId + "&leaveId=" + leaveId + "' onclick='return isdelete()'>删除</a></td>");
                        out.print("<td><a href='Javascript: void(0)' onclick='return reply()'>回复</a></td>");
                    } }%>

            </tr>

            <%
                List<Rereply> list2 = db.select3("select * from rereplay where replayId=" + replayId);
                for (int j=0;j<list2.size();j++){
                    Rereply rereply=list2.get(j);
                    int rereplayId=rereply.getRereplayId();
                    String rereplayname=rereply.getRereplayname();
                    String rereplayBody=rereply.getRereplayBody();
                    Date rerep_timestamp = (Date) rereply.getRep_time();


            %>

            <tr>
                <td><%=rereplayname %>
                </td>
                <td><%=rereplayBody %>
                </td>
                <td><%=dateFormat.format(rerep_timestamp) %>
                </td>
                <%

                    if (uname!=null){
                        if (uname.equals(username)) {
                            out.print("<td><a href='delete_rerep?rereplayId=" + rereplayId + "&leaveId=" + leaveId + "' onclick='return isdelete()'>删除</a></td>");
                        } }%>
            </tr>

            <%
                    }%>

            <%if(uname!=null){%>
            <%--<div id="rep" style="display: none">--%>
                <div id="rep" >
            <form action="replyre?leaveId=<%=leaveId%>" method="post" >
                <input type="hidden" value="<%=uname%>" name="replyName" /><br/>
                <input type="hidden" value="<%=replayId%>" name="replyId"/>
                <label>内容：</label><br>
                <textarea rows="5" cols="100" name="replyBody"></textarea><br/>
                <button type="submit" class="leave-button">发表回复</button>
            </form>
            </div>
            <%}%>

                <%}

                System.out.println(num);
                db.Insert("update leavemessage set repnum=" + num + " where leaveId=" + leaveId);
                num = 0;

            %>
        </table>
        <hr/>
        <%if(uname!=null){%>
        <form action="reply" method="post">
            <label>回复内容</label><br/>
            <textarea rows="5" cols="100" name="replayBody"></textarea><br/>
            <input  type="hidden"  value="<%=leaveId%>"  name="leaveId"/>
            <button  type="submit" class="reply-button"  name="fabiao" />发表回复</button>
        </form>
        <%}%>
    </div>
</div>

</body>
<script>
    function isdelete() {

        if (confirm("是否要删除？")) {
            return true;
        } else return false;
    }

    function reply() {
        document.getElementById('rep').style.display='';
    }


</script>
</html>
