<!-- public head  -->
<%@page language="java" import="java.util.*,util.*" pageEncoding="UTF-8"%>
<%String myusername=(String)session.getAttribute("username");
    int isAdmin=0;
    int score=0;
%>

<link rel="stylesheet" type="text/css" href="css/header.css">
<div class="head">
    <div class="head_main">
        <div class="head_left">
            <a href="leave.jsp"><img src="img/logo_leave.png"></a>
        </div>

        <div class="head_right">
            <%
                if(myusername!=null){
                    Dbutil db=new Dbutil();

                    Users user=new Users();

                    List<Users> list2=db.select("select * from users where username='"+myusername+"'");
                    user=list2.get(0);
                    isAdmin=user.getIsAdmin();
                    score=user.getScore();
                    System.out.println(isAdmin);
                    System.out.println(score);
            %>
            <p> <em><%if (isAdmin==1) {out.print("管理员");}%> </em>  <%=myusername %>  积分：<em><%=score %></em> </p><a href="index.jsp">  退出</a>
            <%}else{out.print("欢迎游客，登陆后即可发帖");}%>
        </div>

        <button class="post" onclick="location.href='post.jsp'">发帖</button>
    </div>
</div>