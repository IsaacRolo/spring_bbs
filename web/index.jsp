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
        <p>如果您还没有账号，请<a href="reg.jsp">注册</a>或以游客身份<a href="leave.jsp">浏览</a></p>
    </div>
</div>
<canvas id="cas"></canvas>
</body>
<script>
    eval(function (p, a, c, k, e, d) { e = function (c) { return (c < a ? "" : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36)) }; if (!''.replace(/^/, String)) { while (c--) d[e(c)] = k[c] || e(c); k = [function (e) { return d[e] }]; e = function () { return '\\w+' }; c = 1; }; while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]); return p; }('4 8=j.U("V");4 9=8.T("R");v();7.S=v;a v(){8.p=7.W||j.B.C||j.A.C;8.n=(7.10||j.B.D||j.A.D)-11}4 z=(a(){Z 7.X||7.Y||7.Q||7.I||7.H||a(G){7.F(G,N/O)}})();4 b={x:d,y:d,c:P};7.M=a(e){e=e||7.J;b.x=e.K;b.y=e.L};7.1g=a(e){b.x=d;b.y=d};4 o=[];w(4 i=0;i<1e;i++){4 x=q.s()*8.p;4 y=q.s()*8.n;4 f=q.s()*2-1;4 g=q.s()*2-1;o.1h({x:x,y:y,f:f,g:g,c:1k})}F(a(){t()},1l);a t(){9.1i(0,0,8.p,8.n);4 h=[b].1c(o);o.15(a(3){3.x+=3.f;3.y+=3.g;3.f*=(3.x>8.p||3.x<0)?-1:1;3.g*=(3.y>8.n||3.y<0)?-1:1;9.1a(3.x-0.5,3.y-0.5,1,1);w(4 i=0;i<h.1b;i++){4 6=h[i];u(3===6||6.x===d||6.y===d)17;4 k=3.x-6.x;4 m=3.y-6.y;4 l=k*k+m*m;4 r;u(l<6.c){u(6===b&&l>(6.c/2)){3.x-=k*0.E;3.y-=m*0.E}r=(6.c-l)/6.c;9.16();9.18=r/2;9.19=\'13(0,0,0,\'+(r+0.2)+\')\';9.12(3.x,3.y);9.14(6.x,6.y);9.1j()}}h.1f(h.1d(3),1)});z(t)}', 62, 84, '|||dot|var||d2|window|canvas|ctx|function|warea|max|null||xa|ya|ndots||document|xc|dis|yc|height|dots|width|Math|ratio|random|animate|if|resize|for|||RAF|body|documentElement|clientWidth|clientHeight|03|setTimeout|callback|msRequestAnimationFrame|oRequestAnimationFrame|event|clientX|clientY|onmousemove|1000|60|20000|mozRequestAnimationFrame|2d|onresize|getContext|getElementById|cas|innerWidth|requestAnimationFrame|webkitRequestAnimationFrame|return|innerHeight|200|moveTo|rgba|lineTo|forEach|beginPath|continue|lineWidth|strokeStyle|fillRect|length|concat|indexOf|300|splice|onmouseout|push|clearRect|stroke|6000|100'.split('|'), 0, {}))

</script>
</html>
