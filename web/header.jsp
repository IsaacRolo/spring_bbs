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
            <p> <em><%if (isAdmin==1) {out.print("管理员");}%> </em>  <%=myusername %>  积分：<em><%=score %></em> <a href="quit">  退出</a></p>
            <%}else{out.print("欢迎游客，<a href='index.jsp'>登陆</a>后即可发帖");}%>
        </div>

        <button class="post" onclick="return canPost()">发帖</button>
        <%--onclick="location.href='post.jsp'"--%>
    </div>
</div>
<script>
    function canPost() {
        var score="<%=score%>";
        var myusername="<%=myusername%>";
        if(myusername!="null") {
            if (score < 100) {
                alert("您当前的积分为：" + score + "，积分不足，无法进行发帖操作");
            }
            else {
                location.href = "post.jsp";
            }
        }
        else {
            alert("发帖请先登录");
        }
    }
</script>