class CashRegister
    attr_accessor :total, :discount, :items, :last
    def initialize(discount = 0, *items)
        @total = 0.0
        @items = items
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        self.last = price * quantity
        quantity.times {@items << title}
        quantity.times {@total += price}
    end

    def apply_discount
     if @discount > 0 
        self.total = (total * ((100.0 - discount.to_f)/100)).to_i
        return  "After the discount, the total comes to $#{total}."
     else
       return "There is no discount to apply."
     end
    end

  

    def void_last_transaction
        @items = @items[0...-1]
        self.total -= self.last
    end 
end