require 'pry'

class CashRegister
  attr_accessor :total, :discount, :price, :quantity, :last_from_total, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @title =  title
    quantity.times do
      @items << title
    end
    @price = price
    @quantity = quantity
    self.total += calculater
    @last_from_total = calculater
    #binding.pry
  end
  
  def calculater
    @price * @quantity
  end
  
  def apply_discount
    if @discount != 0
      @total -= (@total * (0.01 * @discount)).to_i
      return "After the discount, the total comes to $#{@total}."
    elsif @discount == 0
      return "There is no discount to apply."
    end
    #binding.pry
  end
  
  def items
    @items
    #binding.pry
  end  
  
  def void_last_transaction
    self.total -= @last_from_total
  end
end

new_register = CashRegister.new
new_register.add_item("eggs", 1.99)
new_register.add_item("tomato", 1.76, 3)
new_register.items
