$(document).ready(function() {
  shipping_address_box_toggle()

  $(".checkbox-label").on('click', function(){
    shipping_address_box_toggle()
  });
  
  function shipping_address_box_toggle(){
    $('#shipping_address_box').toggle(!$('#order_use_billing_address').is(':checked'))
  }
});
