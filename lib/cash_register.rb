require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount 
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    
    quantity.times { @items << title}

    self.last_transaction = price * quantity
  end

  def apply_discount
    discount_amount = (100.0 - @discount.to_f) / 100.0 
    @total = (@total.to_f * discount_amount).to_i

    if discount == nil
      "There is no discount to apply."
    else 
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    self.total -= @last_transaction
    # binding.pry
  end


end #class end