/**
 * Created by xuhuanfeng on 2017/4/1.
 */

var uid ;
var ins = new mdui.Dialog("#dialog");
function unFollowd(tuid) {
    uid = tuid;
    $("#dialog_content").text("确定取消订阅该用户？ 此操作不可恢复");
    ins.open();
}

$("#confirm").click(function () {
    $.ajax({
        type:"POST",
        url:"/UserManager/unFollow",
        data:{
            uid:uid
        },
        success:function () {
            $('#'+uid).remove();
        }
    })
});