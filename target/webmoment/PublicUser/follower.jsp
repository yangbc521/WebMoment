<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 15:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>关注者</title>
    <link href="../css/mdui.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="bar.jsp"></jsp:include>
</head>

<body class="mdui-theme-primary-blue mdui-drawer-body-left mdui-appbar-with-toolbar">
<div class="mdui-drawer" id="drawer">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/writeEssay" class="mdui-center">发布新文章</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/getEssay" class="mdui-center">查看文章</a>
        </li>
        <li class="mdui-list-item mdui-ripple mdui-list-item-active">
            <a href="/User/follower" class="mdui-center">关注者</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/info" class="mdui-center">个人信息</a>
        </li>
    </ul>
</div>
<div class="mdui-container">
    <div id="container" style="padding-top: 20px;">
       <div class="mdui-row-xs-4">
           <c:forEach var="follower" items="${followers}">
               <div class="mdui-col">
                    <div class="mdui-card">
                        <div class="mdui-card-header">
                            <div class="mdui-card-header-title">${follower.nickname}</div>
                        </div>
                        <div class="mdui-card-media">
                             <img src="${follower.icon}" class="mdui-img-fluid" alt="${follower.nickname}">
                        </div>
                        <div class="mdui-card-content">${follower.introduction}</div>
                    </div>
               </div>
           </c:forEach>
       </div>
       <%-- <div class="mdui-card">
            <div class="mdui-card-header">
                <div class="mdui-card-header-title">${User.nickname}</div>
            </div>
            <div class="mdui-card-media">
                <img src="${User.icon}" alt="${User.nickname}" style="width: 140px;height: auto;">
            </div>
            <div class="mdui-card-content">${User.introduction}</div>
        </div>--%>

        <div class="mdui-dialog" id="dialog">
            <div class="mdui-dialog-title">温馨提示</div>
            <div class="mdui-dialog-content" id = "dialog_content">lalal</div>
            <div class="mdui-dialog-actions">
                <button class="mdui-btn mdui-ripple mdui-color-pink-accent" id="confirm" mdui-dialog-confirm>确定</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/mdui.min.js"></script>
</body>
</html>
