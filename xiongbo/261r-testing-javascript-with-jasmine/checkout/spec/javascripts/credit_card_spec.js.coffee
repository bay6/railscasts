describe "CreditCard", ->
  it "strips our speces and dashed from number", ->
    card = new CreditCard("1 2 -3")
    expect(card.number).toBe("123")

  it "validates number using mod 10", ->
    valideCard = new CreditCard("4111-1111-1111 1111")
    invalidCard = new CreditCard("41111111111113")
    expect(valideCard.validNumber()).toBeTruthy()
    expect(invalidCard.validNumber()).toBeFalsy()

