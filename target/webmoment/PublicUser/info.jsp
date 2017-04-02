<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 15:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>个人信息</title>
    <link href="../css/mdui.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="bar.jsp"></jsp:include>
</head>

<body class="mdui-theme-primary-blue mdui-drawer-body-left mdui-appbar-with-toolbar">
<div class="mdui-drawer" id="drawer">
    <%--导航栏--%>
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/writeEssay" class="mdui-center">发布新文章</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/getEssay" class="mdui-center">查看文章</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <a href="/User/follower" class="mdui-center">关注者</a>
        </li>
        <li class="mdui-list-item mdui-ripple mdui-list-item-active">
            <a href="/User/info" class="mdui-center">个人信息</a>
        </li>
    </ul>
</div>
<div class="mdui-container">
    <div id="container" style="padding-top: 20px;">
        <div class="mdui-panel" mdui-panel>
            <%--昵称--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                   <div class="mdui-panel-item-title">昵称</div>
                    <div class="mdui-panel-item-summary">${User.nickname}</div>
                </div>
            </div>
            <%--手机号码--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">手机号码</div>
                    <div class="mdui-panel-item-summary">${User.phone}</div>
                </div>
            </div>
            <%--邮箱地址--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">邮箱地址</div>
                    <div class="mdui-panel-item-summary">${User.email}</div>
                </div>
            </div>
            <%--注册时间--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">注册时间</div>
                    <div class="mdui-panel-item-summary">${User.enrolltime}</div>
                </div>
            </div>
            <%--自我介绍--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">自我介绍</div>
                    <div class="mdui-panel-item-summary">${User.introduction}</div>
                    <i class="mdui-panel-item-arrow mdui-icon material-icons">&#xe313;</i>
                </div>
                <div class="mdui-panel-item-body">
                    <div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">自我介绍</label>
                        <textarea id="introduction" class="mdui-textfield-input"maxlength="150"></textarea>
                    </div>
                    <span id = "hint1"></span>
                    <div class="mdui-panel-item-actions">
                        <button class="mdui-bnt mdui-color-pink mdui-ripple">取消</button>
                        <button class="mdui-bnt mdui-color-pink mdui-ripple" onclick="update('introduction')">保存更改</button>
                    </div>
                </div>
            </div>
            <%--头像--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">头像</div>
                    <i class="mdui-panel-item-arrow mdui-icon material-icons">&#xe313;</i>
                </div>
                <div class="mdui-panel-item-body">
                    <img src="${User.icon}" class="mdui-img-rounded" alt="${User.nickname}"
                         style="width: 140px;height: auto;">
                    <div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">新头像地址</label>
                        <input type="url" class="mdui-textfield-input" id="icon">
                    </div>
                    <span id="hint2"></span>
                    <div class="mdui-panel-item-actions">
                        <button class="mdui-bnt mdui-color-pink mdui-ripple">取消</button>
                        <button class="mdui-bnt mdui-color-pink mdui-ripple" onclick="update('icon')">保存更改</button>
                    </div>
                </div>
            </div>
            <%--密码--%>
            <div class="mdui-panel-item">
                <div class="mdui-panel-item-header">
                    <div class="mdui-panel-item-title">密码</div>
                    <i class="mdui-panel-item-arrow mdui-icon material-icons">&#xe313;</i>
                </div>
                <div class="mdui-panel-item-body">
                    <div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">旧密码</label>
                        <input class="mdui-textfield-input" type="password" required id="oldPassword">
                    </div>
                    <div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">新密码</label>
                        <input class="mdui-textfield-input" type="password" required id="newPassword1">
                    </div>
                    <div class="mdui-textfield-floating-label">
                        <label class="mdui-textfield mdui-textfield-label">重复新密码</label>
                        <input class="mdui-textfield-input" type="password" required id="newPassword2">
                    </div>
                    <span id="hint3"></span>
                    <div class="mdui-panel-item-actions">
                        <button class="mdui-bnt mdui-color-pink mdui-ripple">取消</button>
                        <button class="mdui-bnt mdui-color-pink mdui-ripple" onclick="update('password')">保存更改</button>
                    </div>
                </div>
            </div>
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
<script type="text/javascript" src="../js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../js/mdui.min.js"></script>
<script type="text/javascript" src="../js/info.js"></script>

</body>
</html>
