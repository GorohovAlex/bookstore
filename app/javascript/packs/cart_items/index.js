$(document).ready(function() {
  $(".quantity-plus").on('click', function(){
    event.preventDefault();
    change_quantity(this.parentElement, 1)
  });
  
  $("a.quantity-minus").on('click', function(){
    event.preventDefault();
    change_quantity(this.parentElement, -1)
  });
  
  function change_quantity(form, value){
    var quantity_input = form.getElementsByClassName('quantity-input')[0]
    var quantity_value = parseInt(quantity_input.value) + value
    if(quantity_value > 0) {
      quantity_input.value = quantity_value 
      form.dispatchEvent(new Event('submit', {bubbles: true}));
    }
  }
});
