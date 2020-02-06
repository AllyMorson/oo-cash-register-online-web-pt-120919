require 'pry'

class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

#sets an instance variable @total on initialization to zero
#takes an optional employee discount on initialization

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

#accepts a title and a price and increases the total, optional quantity , quantity must equal 1 b/c adding an item
#amount times quantity eg: waffle maker is $5 += is adding existing total to new item cost and setting total = overall sum 


  def add_item(product, price, quantity=1)
    self.total += price * quantity
    quantity.times do #eg: 2 waffle makers add products to items array twice 
      items << product
    end
    
    #doesnt forget about previous total
   self.last_transaction = price * quantity
  end
#initialized with an employee discount applies the discount to the total price
#initialized with an employee discount returns success message with updated total
#nitialized with an employee discount returns a string error message that there is no discount to apply

  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      #binding.pry eg:640 = (800 * ((100.00 - 80)/100 = 0.8
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

#subtracts the last item from the total
#returns the total to 0.0 if all items have been removed
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end