<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 12:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="css/mdui.min.css" type="text/css">
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
                    <h3 class="mdui-text-center">注册</h3>
                    <span class="mdui-text-color-red" id = "hint"></span>
                    <form method="post" id="aform"  action="UserManager/register">
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">昵称</label>
                            <input type="text" name="nickname" class="mdui-textfield-input" required>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">邮箱地址</label>
                            <input type="email" name="email" class="mdui-textfield-input" required>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">手机号码</label>
                            <input type="tel" name="phone" class="mdui-textfield-input" required>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">密码</label>
                            <input type="password" name="password" class="mdui-textfield-input" required>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">重复密码</label>
                            <input type="password" name="repassword" class="mdui-textfield-input" required>
                        </div>
                        <label class="mdui-radio">
                            <input type="radio" name="type" value="O" checked>
                            <i class="mdui-radio-icon"></i>普通用户
                        </label>
                        <label class="mdui-radio mdui-float-right">
                            <input type="radio" name="type" value="P">
                            <i class="mdui-radio-icon"></i>公众号用户
                        </label>
                        <br>
                        <button class="mdui-btn mdui-btn-block mdui-color-blue">注册</button>
                    </form>
            </div>
        </div>
    </div>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>
    <script src="js/mdui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#hint").text("");
        $('#aform').submit(function (ev) {
            $.ajax({
                type:"POST",
                url:"UserManager/register",
                data:$('#aform').serialize(),
                success:function (data) {
                    var json = eval('(' + data + ')');
                    if(json.success) {
                        alert(json.path);
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
