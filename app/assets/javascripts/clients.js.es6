
$(document).ready(function(){
  var new_client = new Form($(".new-client-form"), "/clients", "POST");
  var update_client = new Form($(".update-client-form"), $(".update-client-form").attr("action"), "PUT")
});
