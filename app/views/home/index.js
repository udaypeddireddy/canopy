<% unless @timesheets.blank? %>
	$('.endless_scroll_inner_wrap').append("<%=escape_javascript(render :partial => 'post', :collection => @timesheets)%>");
	$('ul').attr('last', '<%=@timesheets.to_a.last.created_at%>')
<% else %>
	$('#infinite-scroll').detach();
<% end %>


<% unless @user_requests.blank? %>
	$('.endless_scroll_inner_wrap').append("<%=escape_javascript(render :partial => 'post', :collection => @user_requests)%>");
	$('ul').attr('last', '<%=@user_requests.to_a.last.created_at%>')
<% else %>
	$('#infinite-scroll').detach();
<% end %>


<% unless @status_reports.blank? %>
	$('.endless_scroll_inner_wrap').append("<%=escape_javascript(render :partial => 'post', :collection => @status_reports)%>");
	$('ul').attr('last', '<%=@status_reports.to_a.last.created_at%>')
<% else %>
	$('#infinite-scroll').detach();
<% end %>