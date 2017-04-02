<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 7:18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
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
    <div class="mdui-container">
        <div class="mdui-row">
            <div class="mdui-col-xs-4 mdui-col-offset-xs-4">
                <h3 class="mdui-text-center">登录</h3>
                <form method="post" action="UserManager/login" id="aform">
                    <div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">手机号码</label>
                        <input class="mdui-textfield-input" name="phone" type="tel" id="phone" required>
                    </div>
                    <div class="mdui-textfield mdui-textfield-floating-label">
                        <label  class="mdui-textfield-label">密码</label>
                        <input class="mdui-textfield-input" name="password" id="password"  type="password" required>
                    </div>
                    <span class="mdui-text-color-red" id="hint"></span>
                    <br>
                    <button class="mdui-btn mdui-btn-block mdui-color-green mdui-ripple">登录</button>
                </form>
            </div>
        </div>
    </div>
    <script src="js/lib/jquery-1.10.2.min.js"></script>
    <script src="js/mdui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('#aform').submit(function (ev) {
            $.ajax({
                type:"POST",
                url:"UserManager/login",
                data:$('#aform').serialize(),
                success:function (data) {
                    var json = eval('(' + data + ')');
                    if(json.success) {
                        window.location.href = json.path;
                    }else{
                        $("#hint").text(json.msg);
                    }
                }
            });
            ev.preventDefault();
        });
    </script>
</body>
</html>
