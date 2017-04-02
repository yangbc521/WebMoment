<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 15:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>WebMoment</title>
    <link href="css/mdui.min.css" rel="stylesheet" type="text/css">
</head>
<body class="mdui-appbar-with-toolbar mdui-theme-primary-blue">
    <div class="mdui-toolbar mdui-color-theme mdui-appbar-fixed">
        <a href="javascript:;" class="mdui-btn mdui-btn-icon" ><i class="mdui-icon material-icons">&#xe5d2;</i></a>
        <a href="javascript:;" class="mdui-typo-headline">WebMoment</a>
        <div class="mdui-toolbar-spacer"></div>
        <button class="mdui-btn mdui-btn-icon" mdui-menu="{target:'#menu'}">
            <i class="mdui-icon material-icons">&#xe5d4;</i>
        </button>
        <ul class="mdui-menu" id="menu">
            <li class="mdui-menu-item">
                <a href="javascript:;">使用帮助尚未完成</a>
            </li>
        </ul>
    </div>
    <div class="mdui-typo">
        <p class="mdui-center">欢迎使用WebMoment，你可以选择<a href="register.jsp">注册</a>
            或者<a href="login.jsp">已有账号</a> </p>
    </div>
<script src="js/mdui.min.js"></script>
</body>
</html>