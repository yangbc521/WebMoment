<%--
  User: xuhuanfeng
  Date: 2017/3/30
  Time: 16:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-theme mdui-appbar-fixed">
        <a href="javascript:;" class="mdui-btn mdui-btn-icon" mdui-drawer="{target:'#drawer'}"><i class="mdui-icon material-icons">&#xe5d2;</i></a>
        <a href="javascript:;" class="mdui-typo-headline">WebMoment</a>
        <div class="mdui-toolbar-spacer"></div>
        <button class="mdui-btn mdui-btn-icon" mdui-menu="{target:'#example-attr'}">
            <i class="mdui-icon material-icons">&#xe5d4;</i>
        </button>
        <ul class="mdui-menu" id="example-attr">
            <li class="mdui-menu-item">
               <img src="${User.icon}" class="mdui-img-circle mdui-center" style="width: 100px;height: 100px;">
                <p class="mdui-text-center">${User.nickname}</p>
            </li>
            <li class="mdui-divider"></li>
            <li class="mdui-menu-item">
                <a href="/UserManager/logout" class="mdui-ripple mdui-text-center">退出登录</a>
            </li>
        </ul>
    </div>
</div>