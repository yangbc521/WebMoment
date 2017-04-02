/**
 * Created by xuhuanfeng on 2017/3/31.
 */


function showEssay(title, content, author) {
    var ins = new mdui.Dialog("#dialog");
    //alert(title);
    $("#dialog_title").html(title +"   " + "<small>"+author+"</small>");
    $("#dialog_content").html(content);
    ins.open();
}