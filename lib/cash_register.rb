require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_from_total, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_from_total = 0
  end

  def add_item(title, price, quantity = 1)
    @title =  title
    quantity.times do
      @items << title
    end
    self.last_from_total = price * quantity
    self.total += self.last_from_total
    #binding.pry
  end
  
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= (@total * (0.01 * @discount)).to_i
      return "After the discount, the total comes to $#{@total}."
    end
    #binding.pry
  end
  
  def items
    @items
    #binding.pry
  end  
  
  def void_last_transaction
    self.total -= self.last_from_total
  end
end
