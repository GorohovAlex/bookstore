$(document).ready(function() {
  $(".quantity-plus").on('click', function(){
    event.preventDefault();
    var form = this.parentElement
    var quantity_input = form.getElementsByClassName('quantity-input')[0]
    quantity_input.value = parseInt(quantity_input.value) + 1
    form.dispatchEvent(new Event('submit', {bubbles: true}));
  });

  $("a.quantity-minus").on('click', function(){
    event.preventDefault();
    var form = this.parentElement
    var quantity_input = form.getElementsByClassName('quantity-input')[0]
    quantity_input.value = parseInt(quantity_input.value) - 1
    form.dispatchEvent(new Event('submit', {bubbles: true}));
  });
});
