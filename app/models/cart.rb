class Cart

  def initialize(hash)
    @items = []

    hash.each do |taco_id, quantity|
      @items << CartItem.new(Taco.find(taco_id), quantity)
    end
  end

  def total_in_cents
    @items.map(&:subtotal_in_cents).sum
  end

  def total
    total_in_cents / 100.0
  end

  def description
    @items.map(&:description).join(", ")
  end

  def items
    @items
  end
end
