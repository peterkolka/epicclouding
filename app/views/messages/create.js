$(".message-box").empty().append('<%= escape_javascript(render @messages) %>');
$(".new-message").empty().append('<%= escape_javascript(render :partial=> "/messages/form") %>');