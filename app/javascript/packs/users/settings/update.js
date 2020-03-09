$(document).ready(function() {
  $("#remove_checkbox").change(function() {
    $('#remove_button').prop('disabled', !this.checked);
    if(this.checked) {
      $('#remove_button').removeClass('disabled')
    } else {
      $('#remove_button').addClass('disabled')
    }
  });
});
