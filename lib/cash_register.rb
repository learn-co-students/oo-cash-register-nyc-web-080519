require "pry"

class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_item_price

    def initialize(discount=0)
        @total = 0.00
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        total_price = price * quantity
        self.last_item_price = total_price
        self.total += total_price
        quantity.times { self.items << title }
    end

    def apply_discount
        if self.discount != 0
            self.total = (self.total * (1 - (self.discount.to_f / 100))).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item_price
    end

end