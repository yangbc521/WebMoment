/**
 * Created by xuhuanfeng on 2017/4/1.
 */

function update(type) {
    var $icon = "";
    var $introduction = "";
    var $oldPassword = "";
    var $newPassword1 = "";
    var $newPassword2 = "";

    if ("icon" === type){
       $icon =  $("#icon").val();
        if($icon == ""){
            $("#hint2").addClass("mdui-text-color-red").text("请输入合法的头像地址");
            return;
        }else{
            $.ajax({
               type:"POST",
                url:"/UserManager/updateIcon",
                data:{
                   icon:$icon
                },
                success:function (data) {
                   var json = eval('(' + data + ')');
                   $("#hint2").removeClass();
                   $("#hint2").addClass(json.hint).text(json.msg);
                }
            });
        }
    }else if ("introduction" === type){
        $introduction = $("#introduction").val();
        $.ajax({
            type:"POST",
            url:"/UserManager/updateIntroduction",
            data:{
                introduction:$introduction
            },
            success:function (data) {
                var json = eval('(' + data + ')');
                $("#hint1").removeClass();
                $("#hint1").addClass(json.hint).text(json.msg);
            }
        });

    }else if ("password" === type){
        $oldPassword = $("#oldPassword").val();
        $newPassword1 = $("#newPassword1").val();
        $newPassword2 = $("#newPassword2").val();
        var $msg = "";
        if($newPassword2 == ""){
            $msg = "请重复输入旧密码";
        }
        if ($newPassword1 == ""){
            $msg = "请输入新密码";
        }
        if ($oldPassword == ""){
            $msg = "请输入旧密码";
        }
        if($newPassword1 != $newPassword2){
            $msg = "两次输入的密码不一致";
        }
        if ($msg != ""){
            $("#hint3").addClass("mdui-text-color-red").text($msg);
        }else{
            $.ajax({
                type:"POST",
                url:"/UserManager/updatePassword",
                data:{
                    oldPassword:$oldPassword,
                    newPassword:$newPassword1
                },
                success:function (data) {
                    var json = eval('(' + data + ')');
                    $("#hint3").removeClass();
                    $("#hint3").addClass(json.hint).text(json.msg);
                }
            });
        }

    }
}