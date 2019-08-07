class CashRegister

  attr_accessor :total, :discount, :quantity

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @price_array = []
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity = 1)
    @quantity = quantity
    @total += @quantity * price
    @price_array << @quantity * price
    until @quantity == 0 do
      @items << title
      @quantity -= 1
    end
  end

  def apply_discount
    if @discount == 0 
      "There is no discount to apply."
    else
      @discount = @discount/100.to_f
      @total -= @total * @discount
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @price_array.pop
    if @items.empty?
      @total = 0.0
    end
  end

end # end of CashRegister class