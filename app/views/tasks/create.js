$('.incompleted-tasks').append("<%=j render partial: 'task', :locals => { :task => @task } %>")
setXeditable()
