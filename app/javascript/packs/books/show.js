$(document).ready(function() {
  $('a.quantity-plus').on('click', function(){
    event.preventDefault()
    change_quantity(this.parentElement, 1)
  });
  
  $("a.quantity-minus").on('click', function(){
    event.preventDefault()
    change_quantity(this.parentElement, -1)
  });
  
  function change_quantity(form, value){
    var quantity_input = form.getElementsByClassName('quantity-input')[0]
    value = parseInt(quantity_input.value) + value
    quantity_input.value = isNaN(value) || value == '' || value < 1 ? 1 : value
  }

  $("#read_more").on('click', function(){
    event.preventDefault()
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnMore = document.getElementById("read_more");
   
    dots.style.display = "none";
    moreText.style.display = "inline";
    btnMore.style.display = "none";
  });
});
