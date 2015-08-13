$("#all-tasks").html("<%= j render 'index' %>")
$(".sort").html("<%= j render 'sort' %>")
setXeditable()
setArrowDirection('<%= params[:direction] %>','<%= params[:sort] %>')
