class CartItem
  attr_accessor :taco, :quantity
  def initialize(taco, quantity)
    @taco = taco
    @quantity = quantity
  end

  def subtotal_in_cents
    quantity * taco.price_in_cents
  end

  def subtotal
    subtotal_in_cents / 100.0
  end

  def description
    [quantity, taco.name].join(" ")
  end
end
