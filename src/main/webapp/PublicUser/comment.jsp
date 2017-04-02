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
    <title>评论</title>
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
            <a href="/User/comment" class="mdui-center">管理评论</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/follower" class="mdui-center">关注者</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/info" class="mdui-center">个人信息</a>
        </li>
    </ul>
</div>
<div class="mdui-container">
    <div id="container" style="padding-top: 20px;">
        <div class="mdui-panel" mdui-panel>
            <c:forEach var="essay" items="${essays}">
                <c:if test="${ !empty comments[essay.eid]}">
                    <div class="mdui-panel-item">
                        <div class="mdui-panel-item-header">
                            <div class="mdui-panel-item-title">文章 《${essay.title}》</div>
                            <div class="mdui-panel-item-summary mdui-text-color-red">有新的评论</div>
                            <i class="mdui-panel-item-arrow mdui-icon material-icons">&#xe313;</i>
                        </div>
                        <div class="mdui-panel-item-body">
                           <c:forEach var="comment" items="${comments[essay.eid]}">
                               <p>${comment.content}00000
                                   <span class="mdui-float-right">
                                       <button class="mdui-btn mdui-ripple mdui-color-green">通过</button>
                                       <button class="mdui-btn mdui-ripple mdui-color-grey">忽略</button>
                                   </span>
                               </p>
                               <hr>
                           </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            </div>
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
