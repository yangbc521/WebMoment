<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 15:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>公众号平台</title>
    <link href="../css/mdui.min.css" rel="stylesheet" type="text/css">
    <link href="../css/wangEditor.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="bar.jsp"></jsp:include>
</head>

<body class="mdui-theme-primary-blue mdui-drawer-body-left mdui-appbar-with-toolbar">
    <div class="mdui-drawer" id="drawer">
        <ul class="mdui-list">
            <li class="mdui-list-item mdui-ripple mdui-list-item-active">
                <a href="/User/writeEssay" class="mdui-center">发布新文章</a>
            </li>
            <li class="mdui-list-item mdui-ripple">
                <a href="/User/getEssay" class="mdui-center">查看文章</a>
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
            <%--<p class="mdui-typo-title">编辑文章</p>--%>
            <div class="mdui-textfield mdui-textfield-floating-label" style="width: 90%;">
                <label class="mdui-textfield-label">文章标题</label>
                <input type="text" class="mdui-textfield-input" maxlength="25" id="title">
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label" style="width: 90%;">
                <label class="mdui-textfield-label">作者</label>
                <input type="text" class="mdui-textfield-input" maxlength="10"  id="author">
            </div>
            <div style="width: 90%;">
                <div id="editor" style="height: 350px; max-height: 500px;">
                </div>
            </div>
            <br>
            <div class="mdui-dialog" id="dialog">
                <div class="mdui-dialog-title">温馨提示</div>
                <div class="mdui-dialog-content" id = "dialog_content">lalal</div>
                <div class="mdui-dialog-actions">
                    <button class="mdui-btn mdui-ripple mdui-color-pink-accent" id="confirm" mdui-dialog-confirm>确定</button>
                </div>
            </div>

            <button class="mdui-btn mdui-color-green" id="publishEssay">发布文章</button>
        </div>
    </div>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/mdui.min.js"></script>
    <script type="text/javascript" src="../js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var editor = new wangEditor("editor");
        editor.create();
    </script>
    <script src="../js/home.js" type="text/javascript"></script>
</body>
</html>
