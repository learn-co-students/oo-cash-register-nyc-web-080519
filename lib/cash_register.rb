class CashRegister
  attr_accessor :total, :discount, :items, :last_transation

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty=1)
    self.total += price * qty
    qty.times do 
        items << title
    end
    self.last_transation = price * qty
  end

  def apply_discount
    if @discount > 0
        self.total = self.total - (self.total * (@discount.to_f * 0.01))
    elsif @discount = 0
        return "There is no discount to apply."
    end
    return "After the discount, the total comes to $#{self.total.to_i}."
  end



  def void_last_transaction
    self.total = self.total - self.last_transation
  end

end # end of CashRegister class
