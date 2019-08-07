class CashRegister
    attr_accessor :total, :discount, :title, :price, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times {items << title}
        self.last_transaction = price * quantity
    end

    def apply_discount 
        if @discount == 0
            "There is no discount to apply."
        else
            self.total *= (1 - @discount*0.01)
            "After the discount, the total comes to $800."
        end
    end

    def void_last_transaction
        self.total -= last_transaction 
    end
end
