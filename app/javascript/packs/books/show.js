$(document).ready(function() {
  $('#quantity-plus').on('click', function(){
    event.preventDefault()
    var value = $("#quantity-value").val()
    value = isNaN(value) || value == '' ? BOOK_ORDER_COUNT_DEFAULT : parseInt(value) + 1
    $('#quantity-value').val(value)
  });

  $("#quantity-minus").on('click', function(){
    event.preventDefault()
    var value = $("#quantity-value").val()
    value = isNaN(value) || value == '' || value == '1' ? 1 : parseInt(value) - 1
    $("#quantity-value").val(value)
  });

  $("#read_more").on('click', function(){
    event.preventDefault()
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnLess = document.getElementById("read_less");
    var btnMore = document.getElementById("read_more");
   
    dots.style.display = "none";
    moreText.style.display = "inline";
    btnLess.style.display = "inline";
    btnMore.style.display = "none";
  });

  $("#read_less").on('click', function(){
    event.preventDefault()
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnLess = document.getElementById("read_less");
    var btnMore = document.getElementById("read_more");
  
    dots.style.display = "inline";
    moreText.style.display = "none";
    btnLess.style.display = "none";
    btnMore.style.display = "inline";
  });
});
