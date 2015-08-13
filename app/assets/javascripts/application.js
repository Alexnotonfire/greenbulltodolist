// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap3-editable/bootstrap-editable
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker
//= require_tree .

var setXeditable;

$.fn.editable.defaults.mode = 'inline';

setXeditable = function() {
  return $("[data-xeditable=true]").each(function() {
    return $(this).editable({
      ajaxOptions: {
        type: "PUT",
        dataType: "json"
      },
      params: function(params) {
        var railsParams;
        railsParams = {};
        railsParams[$(this).data("model")] = {};
        railsParams[$(this).data("model")][params.name] = params.value;
        return railsParams;
      }
    });
  });
};

 function setArrowDirection(dir, sort){
  var nam = document.getElementById(sort)
  if(dir == "asc")
    nam.className = "glyphicon glyphicon-arrow-down active"
  else
    nam.className = "glyphicon glyphicon-arrow-up active"
}

function pressing(arg){
      user_id = $(arg).attr('data-user-id')
      id = $(arg).attr('data-id')
      value = $(arg).is(":checked")
      $(arg).attr('data-id')
      html=$(arg).closest("div")
      $(html).change()
      $(arg).closest("div").remove()
      path = '/users/' + user_id + '/tasks/' + id

       if(value){
         complete = true;
         $('.completed-tasks').append(html)
       }
       else{
         complete = false;
          $('.incompleted-tasks').append(html)
       }

      setXeditable()

      $.ajax({
        url : path,
        type : 'PUT',
        dataType: "json",
        data: { task: {id: id, complete: value}}
      })
    }
