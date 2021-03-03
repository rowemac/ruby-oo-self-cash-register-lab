require 'pry'

class CashRegister

    attr_accessor :total, :discount, :quantity, :items, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @quantity = 0
        @items = []
        @last_transaction = 0
    end
    
    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        @last_transaction = price * quantity
        while quantity > 0
            @items << title
            quantity -= 1
        end
    end

    def apply_discount
        self.total -= (@total * (@discount.to_f / 100))
        if @discount > 0     
            return "After the discount, the total comes to $#{total.round}."
        elsif @discount <= 0
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_transaction
    end 


end

