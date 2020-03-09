$(document).ready(function() {
  
  rating_input_item = "input[name='review_form[rating]']"
  
  $(rating_input_item).on('click', function() {
    rating_val = $(rating_input_item + ":checked").val()

    for(var j = rating_val; j <= 5; j++) {
      $("#review_form_rating_" + j + " + label > i").removeClass('rate-star')
      $("#review_form_rating_" + j + " + label > i").addClass('rate-empty')
    }
    
    for(var i = 1; i <= rating_val; i++) {
      $("#review_form_rating_" + i + " + label > i").addClass('rate-star')
      $("#review_form_rating_" + i + " + label > i").removeClass('rate-empty')
    }
    
  })
})
