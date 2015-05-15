Array.prototype.equals = function (array) {
  // if the other array is a falsy value, return
  if (!array)
    return false;

  // compare lengths - can save a lot of time
  if (this.length != array.length)
    return false;

  for (var i = 0, l=this.length; i < l; i++) {
    // Check if we have nested arrays
    if (this[i] instanceof Array && array[i] instanceof Array) {
      // recurse into the nested arrays
      if (!this[i].equals(array[i]))
        return false;
    }
    else if (this[i] != array[i]) {
      // Warning - two different object instances will never be equal: {x:20} != {x:20}
      return false;
    }
  }
  return true;
};

class Form {
  constructor(form, action, method, validationRules = {}) {
      this.form = form;
      this.formObject = $(form);
      console.log(this.formObject);
      this.actionUrl = $(this.form).attr("action");
      this.method = method;
      this.action = action;
      console.log(this.action);
      this.validate(validationRules)
  }

  show() {
    console.log({
      form: this.form,
      formObject: this.formObject,
      actionUrl: this.actionUrl,
      method: this.method,
      action: this.action
    })
  }

  get_values(){
    var values = {};
    $.each(this.fields(), function(i, val) {
      v = $(val);
      values[v.attr("name")] = v.attr("value");
    });
    return values
  }

  validate() {
    var action = this.action,
        method = this.method;
    $(this.form).validate({
      submitHandler: function(form) {
        $(form).submit()
        //$.ajax({
        //  method: method,
        //  url: action,
        //  data: $(form).serialize(),
        //  datatype: "json"
        //}).done(function (data) {
        //  location.assign(data.location);
        //}).fail(function(data) {
        //  console.log(data)
        //}).always(function(){
        //  console.log("ajax happens :)")
        //});
      }
    })
  }
}