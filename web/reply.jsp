<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.sql.Timestamp" %>
<%@ page language="java" import="java.util.*,util.*,service.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();


    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String uname = (String) session.getAttribute("username");


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
<jsp:include page="header.jsp"></jsp:include>
<%

    String leaveId = request.getParameter("leaveId");
    if (leaveId == null) {
        leaveId = (String) request.getAttribute("leaveId");
    }
    List list ;//帖子回复内容
    List list4 ;//当前登录用户信息
    Users u_m = new Users();
    int u_isAdmin = 0;
    int score_m;

    Dbutil db = new Dbutil();
    Message mess = new Message();
    if (uname != null) {
        list4 = db.select("select * from users where username='" + uname + "'");
        u_m = (Users) list4.get(0);
    }
    list = db.select1("select * from leaveMessage where leaveId=" + leaveId);


    u_isAdmin = u_m.getIsAdmin();
    score_m = u_m.getScore();

    Users m = new Users();
    m = (Users) list.get(0);
    String Id = m.getId();
    String title = m.getTitle();
    String username = m.getUsername();
    String leaveBody = m.getLeaveBody();
    String tag = m.getTag();


%>

<%
    Dbutil db2 = new Dbutil();

    Users user = new Users();

    List<Users> list_a = db2.select("select * from users where username='" + username + "'");
    user = list_a.get(0);
    int isAdmin = user.getIsAdmin();
    int score = user.getScore();
    String degree;

    if (isAdmin == 1) {
        degree = "管理员";
    } else {
        degree = "普通会员";
    }
%>
<div class="reply-main">
    <div class="reply-main-body">
        <div class="reply-title">
            <div class="tag">
                <div class="reply-title-tag">
                    <a href="section.jsp?sectionName=<%=tag%>"><%=tag%>
                    </a>
                </div>
            </div>
            <img src="img/reply-title.png">
            <h2><%=title %>
            </h2>
            <p class="reply-title-content"><%=leaveBody %>
            </p>
            <div class="reply-title-fix">
                <%=degree%> <%=username%>  积分：<%=score%>
            </div>
        </div>

        <div class="reply-list">
            <table>

                <%!int num = 0; %>
                <%

                    List<Users> list1 = db.select2("select * from replay where leaveId=" + leaveId);


                    Dbutil db1 = new Dbutil();
                    Message mess1 = new Message();

                    for (int i = 0; i < list1.size(); i++) {
                        Users m1 = new Users();
                        m1 = (Users) list1.get(i);
                        String replayId = m1.getId();
                        String replayBody = m1.getReplyBody();
                        String replayname = m1.getUsername();
                        Date timestamp = (Date) m1.getRep_time();
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        System.out.println(dateFormat.format(timestamp));
                        System.out.println(replayBody);
                        num = i + 1;

                %>
                <%
                    List<Users> list3 = db.select("select * from users where username='" + replayname + "'");
                    user = list3.get(0);
                    int r_isAdmin = user.getIsAdmin();
                    int r_score = user.getScore();
                    String r_degree;
                    if (r_isAdmin == 1) {
                        r_degree = "<img src='img/reply-A-degree.png'>";
                    } else {
                        r_degree = "<img src='img/reply-N-degree.png'>";
                    }

                %>
                <div class="reply-item">
                    <div class="reply-item-info">
                        <span class="reply-item-info-avatar">
                        <%=r_degree%>
                        </span>
                        <div class="reply-item-info-content">
                            <%=replayname%>
                        </div>
                    </div>

                    <div class="reply-item-content">
                        <p><%=replayBody %>
                        </p>
                    </div>

                    <div class="reply-item-foot">
                        <%

                            if (uname != null) {
                                out.print(" <a href='Javascript: void(0)' onclick='reply(" + i + ")'>回复 </a>");
                                if (uname.equals(username) || u_isAdmin == 1) {
                                    out.print("<a href='delete_rep?replayId=" + replayId + "&leaveId=" + leaveId + "' onclick='return isdelete()'> | 删除</a>");

                                } else {
                                    out.print("|");
                                }
                            }%>

                        <span class="reply-item-foot-right">
                            <%=i + 1 %>楼 | 积分：<%=r_score%> | <%=dateFormat.format(timestamp) %>
                        </span>
                    </div>
                    <%
                        List<Rereply> list2 = db.select3("select * from rereplay where replayId=" + replayId);
                        for (int j = 0; j < list2.size(); j++) {
                            Rereply rereply = list2.get(j);
                            int rereplayId = rereply.getRereplayId();
                            String rereplayname = rereply.getRereplayname();
                            String rereplayBody = rereply.getRereplayBody();
                            Date rerep_timestamp = (Date) rereply.getRep_time();
                    %>
                    <div class="reply-item-reply">

                        <%=rereplayname%>：<%=rereplayBody %>
                        <%

                            if (uname != null) {
                                if (uname.equals(username)) {
                                    out.print("<a href='delete_rerep?rereplayId=" + rereplayId + "&leaveId=" + leaveId + "' onclick='return isdelete()'>删除</a>");
                                }
                            }
                        %>
                    </div>
                    <% }%>
                </div>

                <%if (uname != null) {%>
                <div id="<%=i%>" class="rep" style="display:none;">
                    <form action="replyre?leaveId=<%=leaveId%>" method="post">
                        <input type="hidden" value="<%=uname%>" name="replyName"/>
                        <input type="hidden" value="<%=replayId%>" name="replyId"/>
                        <textarea rows="2" cols="40" name="replyBody"></textarea>
                        <button type="submit" class="leave-button">发表</button>
                    </form>
                </div>
                <%}%>

                <%
                    }

                    System.out.println(num);
                    db.Insert("update leavemessage set repnum=" + num + " where leaveId=" + leaveId);
                    num = 0;

                %>
            </table>
            <%if (uname != null) {%>
            <div class="reply-item-form">
                <form action="reply" method="post" id="reply">
                    <label>回复内容</label><br/>
                    <textarea rows="5" cols="86" name="replayBody"></textarea><br/>
                    <input type="hidden" value="<%=leaveId%>" name="leaveId"/>
                    <button  type="button" class="reply-button" name="fabiao" onclick="canRep()"/>
                    发表回复</button>
                </form>
            </div>

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

    function reply(value) {
        display = document.getElementById(value).style.display;
        if (display == 'none') {
            document.getElementById(value).style.display = 'block';
        } else document.getElementById(value).style.display = 'none';
    }

    function canRep() {
        var score="<%=score_m%>";
            if (score < 80) {
                alert("您当前的积分为：" + score + "，积分不足，无法进行发帖操作");
            }
            else {
                document.getElementById("reply").submit();
            }

        }


</script>
</html>
