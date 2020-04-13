$(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });

 $(function() {
    $('[data-toggle="popover"]').popover();
  });

  function phoneNumCheck(e) {
    console.log("I'm running!")
    var input = e.key
    var regex = /([^\d+])/
    if (regex.test(input) && e.which != 8) {
        e.preventDefault()
    }
}