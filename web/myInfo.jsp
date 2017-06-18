<%@ page import="util.Dbutil" %>
<%@ page import="util.Users" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String myusername=(String)session.getAttribute("username");
    int isAdmin=0;
    int score=0;
    Dbutil db = new Dbutil();
    Users user;
    List<Users> list;
    String email=null;
    String password=null;
    String identity=null;
    String id=null;
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
    <%
        if(myusername!=null) {

            list = db.select("select * from users where username='" + myusername + "'");
            user = list.get(0);
            id=user.getId();
            password=user.getPassword();
            email=user.getEmail();
            isAdmin = user.getIsAdmin();
            score=user.getScore();

            session.setAttribute("id",id);
        }
        if (isAdmin==0){
            identity="普通用户";
        }
        else{
            identity="管理员";
        }
    %>

    <form id="saveMyInfo" action="saveInfo" method="post">
        <p>用户名</p>
        <input type="text" value=<%=myusername%> name="saveUsername">
        <p>密码</p>
        <input id="psw" type="password" value=<%=password%> name="savePsw">
        <p>确认密码</p>
        <input id="psw2" type="password" >
        <p>email</p>
        <input type="text" value=<%=email%> name="saveEmail">
        <p>身份</p>
        <p><%=identity%></p>
        <p>当前积分</p>
        <p><%=score%></p>
        <button  class="leave-button" onclick="return isPsw()">保存</button>
    </form>
</body>
<script>
    function isPsw() {
        var psw=document.getElementById('psw').value;
        var psw2=document.getElementById('psw2').value;
        if(psw==psw2){
            alert("保存成功");
            document.getElementById("saveMyInfo").submit();
        }
        else{
            alert("两次密码输入不一致");
        }
    }
</script>
</html>
