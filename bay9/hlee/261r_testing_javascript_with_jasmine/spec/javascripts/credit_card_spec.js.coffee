describe "CreditCard", ->
  it "strips our speces and dashes from number", ->
    card = new CreditCard("1 2-3")
    expect(card.number).toBe("123")
