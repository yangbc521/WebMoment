/**
 * Created by xuhuanfeng on 2017/3/30.
 */

var ins = new mdui.Dialog("#dialog");

$("#publishEssay").click(function () {

    var $title = $.trim($("#title").val());
    var $author = $.trim($("#author").val());
    var $content = $.trim(editor.$txt.html());
    var $content_tmp = $.trim(editor.$txt.text())
    var msg = "";
    if($title === ""){
        msg = "标题不能为空，请为文章取一个合适的名字";
    }
    if ($author === ""){
        msg = "作者不能为空，请尊重别人的版权哦";
    }
    if($content_tmp === ""){
        msg = "内容不能为空，请用心编写内容哦";
    }
    if(msg != ""){
        $("#dialog_content").text(msg);
        ins.open();
    }else{
        $.ajax({
            type:"POST",
            url:"/EssayManager/publishEssay",
            data:{
                author:$author,
                title:$title,
                content:$content
            },
            success:function (data) {
                var json = eval('(' + data + ')');
                $("#dialog_content").text(json.msg);
                ins.open();
                $("#title").val("");
                $("#author").val("");
                editor.$txt.html('<p><br></p>');
            }
        });
    }
});