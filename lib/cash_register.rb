class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
        self.last_transaction = price * quantity
        quantity.times do
            items << title
          end
    end

    def apply_discount
        if self.discount > 0
            self.total -= self.total * (20.to_f * 0.01)
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end