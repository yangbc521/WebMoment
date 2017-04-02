<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 15:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>已发布文章</title>
    <link href="../css/mdui.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="bar.jsp"></jsp:include>
</head>

<body class="mdui-theme-primary-blue mdui-drawer-body-left mdui-appbar-with-toolbar">
<div class="mdui-drawer" id="drawer">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple mdui-list-item-active">
            <a href="/User/allEssay" class="mdui-center">所有文章</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/followedUser" class="mdui-center">关注的公众号</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/allPublicUser" class="mdui-center">所有的公众号</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/info" class="mdui-center">个人信息</a>
        </li>
    </ul>
</div>
<div class="mdui-container">
    <div id="container" style="padding-top: 20px;">
        <div class="mdui-list">
            <c:forEach var="essay" items="${essays}">
                <div class="mdui-list-item" onclick="showEssay('${essay.title}','${essay.content}','${essay.author}')">
                    《${essay.title}》&nbsp;&nbsp;By&nbsp;${essay.author}
                    &nbsp;&nbsp;&nbsp;${essay.publishtime}</div>
            </c:forEach>
        </div>
        <div class="mdui-dialog" id="dialog">
            <div class="mdui-dialog-title" id="dialog_title"></div>
            <div class="mdui-dialog-content" id ="dialog_content"></div>
            <div class="mdui-dialog-actions">
                <button class="mdui-btn mdui-ripple mdui-color-pink-accent" id="confirm" mdui-dialog-confirm>确定</button>
            </div>
        </div>
    </div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/mdui.min.js"></script>
<script type="text/javascript" src="../js/essay.js"></script>
</body>
</html>
