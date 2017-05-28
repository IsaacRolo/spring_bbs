<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">


</head>

<body>
<div class="login-main">
    <div class="login-main-content">
        <img src="img/logo.png" alt="logo">
        <h2>欢迎来到Spring论坛</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="用户名"><br/>
            <input type="password" name="password" placeholder="密码"><br/>
            <button type="submit" class="login-button">登录</button>
        </form>
        <p>如果您还没有账号，请<a href="reg.jsp">注册</a></p>
    </div>
</div>
</body>
</html>
