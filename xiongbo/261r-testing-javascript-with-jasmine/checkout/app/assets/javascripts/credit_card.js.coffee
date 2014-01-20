$.fn.validateCreditCardNumber = ->
  @each ->
    $(this).blur ->
      card = new CreditCard(@value)
      if !card.validNumber()
        $(this).next('.error').text("invalid card number")
      else
        $(this).next('.error').text("")

