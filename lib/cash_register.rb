require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items, :last_item
  
  
  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end # initialize method

  def total
    @total  
  end #total method

  def add_item(item, price, quantity=1)
    @last_item_price = price
    @last_item = item
    @last_quantity = quantity
    # if quantity == nil
    #   @total += price
    #   @items.push(item)
    # else # if quantitiy == nil
      @total += price * quantity
      quantity.times do 
        @items.push(item)
      end #times loop
    # end  # if quantitiy == nil
  end # add_item method
  
  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else #if @discount == nil
      @total = @total*(1 - (@discount/100.to_f))
      "After the discount, the total comes to $#{@total.to_i}."
    end #if @discount == nil
  end # apply_discount method

  def items
    @items
  end # items method

  def void_last_transaction
    @total = @total - (@last_item_price * @last_quantity)
    @last_quantity.times do
      @items.pop
    end

    
  end

# binding.pry
end

