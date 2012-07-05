(function($) {
    function downleft(handler, panel){
        var pos = handler.offset();
        var left_pos =  pos.left - panel.width() + handler.width();
        var top_pos = pos.top + handler.height();
        return {
            left : left_pos,
            top : top_pos
        }
    }
	
    function down(handler, panel){
        var pos = handler.offset();
        var left_pos =  pos.left + handler.width()/2 - panel.width() /2 ;
        var top_pos = pos.top + handler.height();
        return {
            left : left_pos - 10,
            top : top_pos + 4
        }
    }
	
    function righttop(handler, panel){
        var pos = handler.offset();
        var left_pos =  pos.left + handler.width();
        var top_pos = pos.top - 9;
        return {
            left : left_pos,
            top : top_pos
        }
		
    }
	
    function rightdown(handler, panel){
        var pos = handler.offset();
        var left_pos =  pos.left + handler.width();
        var top_pos = pos.top + handler.height();
        return {
            left : left_pos,
            top : top_pos
        }
		
    }
	
    var postions_box = {
        "down-left" : downleft,
        "down"      : down,
        "right-top" : righttop,
        "right-down" : rightdown
    }
    
    $.fn.megapanel = function(handler, panel, options) {
        options = $.extend($.fn.megapanel.defaults, options);
        var panel = $(panel, this);
        var handler = $(handler, this);
        panel.hide().css('position', 'absolute');
        var pos = postions_box[$.fn.megapanel.defaults.placement](handler, panel)
        $(this).hover(function(){
            panel.css({
                'left': pos.left + 'px',
                'top': pos.top + 'px',
                "z-index": "5000"
            });
            if(options.ajax){
                $.get(options.ajax, {}, function(html){
                   panel.html(html)
                });
            }
            panel.fadeIn('slow');
				
        },function() {
            panel.fadeOut('slow');
        });
        
        $(this).data('scope', this);

    };
	
    $.fn.megapanel.defaults = {
        placement: "down"
    };
})(jQuery);





