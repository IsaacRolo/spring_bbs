<%@ page import="util.Dbutil" %>
<%@ page import="util.Users" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int isAdmin = 0;
    int score = 0;
    Dbutil db = new Dbutil();
    Users user;
    List<Users> list;
    String identity = null;
    String id = null;
    String username=null;
%>
<html>
<head>
    <title>Spring论坛 - Be Better</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/leave.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
        <tr>
            <td>编号</td>
            <td>用户名</td>
            <td>身份</td>
            <td>积分</td>
        </tr>
        </br>
<%


    list = db.select("select * from users ");
    for (int i = 0; i < list.size(); i++) {
        user = list.get(i);
        id = user.getId();
        username=user.getUsername();
        isAdmin = user.getIsAdmin();
        score = user.getScore();
        if (isAdmin == 1) {
            identity = "管理员";
        } else {
            identity = "普通用户";
        }
%>
        <tr>
            <td><%=id%></td>
            <td><%=username%></td>
            <td><%=identity%></td>
            <td><%=score%></td>
            <%if (isAdmin!=1) {%>
            <a href="ban?id=<%=id%>">封禁</a>
            <a href="toAdmin?id=<%=id%>">设为管理员</a>
            <%}%>
        </tr>
        </br>


    <%}%>



</body>
</html>
