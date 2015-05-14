
$(document).ready(function(){
  if ($(".new-client-form").length > 0) {
    var new_client = new Form($(".new-client-form"), "/clients", "POST");
  } else if ($(".update-client-form").length > 0){
    var update_client = new Form($(".update-client-form"), $(".update-client-form").attr("action"), "PUT")
  }
});
