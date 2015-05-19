// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  var num_of_line_items = $('.num_of_line_items').val();
 $(".new-line-item").click(function(){
   num_of_line_items++;
   $(".num_of_line_items").val(num_of_line_items);
   var new_line_item = `<div class="row">
    <div class="col-md-8 form-group">
      <label for="item${num_of_line_items}">Line Item ${num_of_line_items}</label>
      <input type="text" id="item${num_of_line_items}" name="item${num_of_line_items}" class="form-control"/>
    </div>
    <div class="form-group col-md-3">
      <Label for="amount${num_of_line_items}">Line Item ${num_of_line_items} Amount</Label>
      <div class="input-group">
        <span class="input-group-addon">$</span>
        <input id="amount${num_of_line_items}" name="amount${num_of_line_items}" type="number" class="form-control" aria-label="Amount">
      </div>
    </div>
    <div class="col-md-1">
      <span id="remove-li" class="glyphicon glyphicon-remove top-30" aria-hidden="true"></span>
    </div>
  </div>`;
   $(".line-items").append(new_line_item);
 });

  $(".line-items").keydown(function(e){
    var target = $(e.target);
    if (target.attr('id') === "item" + num_of_line_items || target.attr('id') === "amount" + num_of_line_items) {
      num_of_line_items++;
      $(".num_of_line_items").val(num_of_line_items);
      var new_line_item = `<div class="row">
    <div class="col-md-8 form-group">
      <label for="item${num_of_line_items}">Line Item ${num_of_line_items}</label>
      <input type="text" id="item${num_of_line_items}" name="item${num_of_line_items}" class="form-control"/>
    </div>
    <div class="form-group col-md-3">
      <Label for="amount${num_of_line_items}">Line Item ${num_of_line_items} Amount</Label>
      <div class="input-group">
        <span class="input-group-addon">$</span>
        <input id="amount${num_of_line_items}" name="amount${num_of_line_items}" type="number" class="form-control" aria-label="Amount">
      </div>
    </div>
    <div class="col-md-1">
      <span id="remove-li" class="glyphicon glyphicon-remove top-30" aria-hidden="true"></span>
    </div>
  </div>`;
      $(".line-items").append(new_line_item);
    }
  });

  $('.line-items').click(function(e) {
    var target = $(e.target);
    if (target.attr('id') === 'remove-li'){
      console.log(e.target);
      console.log(target);
      var row = target.parent().parent();
      console.log(row);
      var inputs = row.children("input");
      console.log(inputs);
      if (inputs.length > 0) {
        row.children("div").each(function () {
          $(this).remove();
        })
      } else {
        row.remove();
      }
    }
  });

  if ($(".new-invoice-form").length > 0) {
    $(".new-invoice-form").validate({
      submitHandler: function(form) {
        console.log("submit fired");
        var last = $(".line-items").children().last()[0];
        $(last).remove();
        form.submit();
      }
    });
  } else if ($(".edit-invoice-form").length > 0) {
    $(".edit-invoice-form").validate({
      submitHandler: function(form) {
        console.log("submit fired");
        var last = $(".line-items").children().last()[0];
        $(last).remove();

        form.last()
        alert();
      }
    });
  }
});