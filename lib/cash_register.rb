require 'pry'

class CashRegister 

  attr_accessor :discount, :total, :items

  def initialize(discount = 0)
    @items = []
    @total = 0
    @discount = discount
    @last_transaction = []
    if discount > 100
      discount = 100
    elsif discount < 0
      discount = 0
    end
  end
  
  def add_item(item, price, quantity = 1)
    @last_transaction = [price, quantity]
    @total += price * quantity
    counter = 0
    while counter < quantity
      @items << item
      counter += 1
    end
  end

  def apply_discount
    if @discount > 0 
      @total = @total * (100 - discount) / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end 
  end

  def void_last_transaction
    @total -= @last_transaction[0] * @last_transaction[1]
    @items = @items[0...-@last_transaction[1]]
  end

end #end of CashRegister
