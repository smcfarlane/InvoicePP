
$(document).ready(function(){
  if ($(".new-project-form").length > 0) {
    var new_project = new Form($(".new-project-form"), $(".new-project-form").attr("action"), "POST");
  } else if ($(".update-project-form").length > 0) {
    var update_project = new Form($(".update-project-form"), $(".update-project-form").attr("action"), "PUT")
  }
});
