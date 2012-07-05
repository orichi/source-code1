// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
AppUtil = {
    toolbox : function(selector){
        $(selector).corner("5px bottom");
    },

    append_option : function(selector, label, value, selected){
        $(selector).each(function(index, obj){
            var option = new Option(label, value);
            option.selected = selected;
            obj.options.add(option);
        });
    },

    remove_last_option : function(selector){
        $(selector).each(function(index, obj){
            obj.options[obj.options.length - 1] = null;
        });
    },

    remove_options : function(selector, stay){
        $(selector).each(function(index, obj){
            obj.options.length = stay;
        });
    },

    select_option : function(selector, value){
        $(selector).find("option").each(function(){
            alert($(this).val() + " : " + value)
            if($(this).val()==value){
                $(this).attr("selected",true);
            }
        })
    },

    control_checkboxs : function(handler, controled){
        $(handler).click(function(){
            $(controled).attr("checked", this.checked);
        })
    },

    checked_items : function(selector){
        var checkeds = [];
        $(selector).each(function(ind, ele){
            if(ele.checked){
                checkeds.push(ele.value)
            }
        })
        return checkeds;
    }
}

function paid_attention(biz_id){
    $('#biz_attention_'+biz_id).toggleClass("attention attentioned").html('已关注')
}


function to_login_page(){
    window.location = "/customer_sessions/new";
}
function panel_nav(selector){
    //$(selector + " ul").bgiframe();//IE fix
    $(selector + " ul").css({
        display: "none"
    }); // Opera Fix
    var childpanel = "ul:first"
    $(selector + " li").hover(function(){
        $(this).find(childpanel).css({
            visibility: "visible",
            display: "none"
        }).fadeIn();
    },function(){
        $(this).find(childpanel).css({
            visibility: "hidden"
        });
    });
}

function copy_content(content){
    var clipBoardContent=content;
//    clipBoardContent+=document.title; //获取标题
//    clipBoardContent+="\n";
//    clipBoardContent+=this.location.href; //获取地址
    if (window.clipboardData){
        window.clipboardData.setData("Text", clipBoardContent);
    }
    else if (window.netscape){
        netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance

        (Components.interfaces.nsIClipboard);
        if (!clip) return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance

        (Components.interfaces.nsITransferable);
        if (!trans) return;
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance

        (Components.interfaces.nsISupportsString);
        var copytext=clipBoardContent;
        str.data=copytext;
        trans.setTransferData("text/unicode",str,copytext.length*2);
        var clipid=Components.interfaces.nsIClipboard;
        if (!clip) return false;
        clip.setData(trans,null,clipid.kGlobalClipboard);
    }
    alert("复制成功,您可以发送给你的好友啦!");
}

