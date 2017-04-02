/**
 * Created by xuhuanfeng on 2017/4/1.
 */

function addFollow(uid) {
    $.ajax({
        type:"POST",
        url:"/UserManager/addFollow",
        data:{
            uid:uid
        },
        success:function () {
            var ins = new mdui.Dialog("#dialog");
            $("#dialog_content").text("关注成功");
            $('#' + uid).remove();
            ins.open();
        }
    })
}