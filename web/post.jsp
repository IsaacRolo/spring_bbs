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
  <jsp:include page="header.jsp"></jsp:include>
  <div class="leave-main">
      <div class="leave-main-body">
        <h1>Spring论坛</h1>
        <p>欢迎</p>
        <hr/>
        <form action="leave" method="post">
          <label>标题：</label><br/>
            <input type="text" name="title" /><br/>
            <label>帖子分类：</label><br/>
            <select name="tag">
              <option>Java</option>
              <option>C</option>
              <option>C++</option>
              <option>PHP</option>
              <option>Python</option>
              <option>C#</option>
              <option>JavaScript</option>
              <option>Visual Basic .Net</option>
              <option>Swift</option>
              <option>其他</option>
          </select><br/>
          <label>内容：</label><br>
          <textarea rows="5" cols="100" name="leaveBody"></textarea><br/>
          <button type="submit" class="leave-button">发表帖子</button>
        </form>
        <hr/>
    
      </div>    
    </div>
  </body>
</html>
