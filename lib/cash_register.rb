class CashRegister
  attr_accessor :total, :employee_discount, :items

  def initialize(employee_discount = 0)
    @total = 0
    @employee_discount = employee_discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @items.concat([title] * quantity)
  end

  def apply_discount
    if @employee_discount > 0
      discount_amount = @total * @employee_discount / 100.0
      @total -= discount_amount
      "After the discount, the total comes to $#{@total.to_i}"
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    last_item_price = @items.pop
    @total -= last_item_price
  end
end
