// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  var num_of_line_items = 1;
 $(".new-line-item").click(function(){
   num_of_line_items++;
   $(".num_of_line_items").val(num_of_line_items);
   var new_line_item = `<div class="row">
    <div class="col-md-8 form-group">
      <label for="item${num_of_line_items}">Line Item ${num_of_line_items}</label>
      <input type="text" id="item${num_of_line_items}" name="item${num_of_line_items}" class="form-control"/>
    </div>
    <div class="form-group col-md-4">
      <Label>Line Item ${num_of_line_items} Amount</Label>
      <div class="input-group">
        <span class="input-group-addon">$</span>
        <input name="amount${num_of_line_items}" type="text" class="form-control" aria-label="Amount">
      </div>
    </div>
  </div>`;
   $(".line-items").append(new_line_item);
 });
});