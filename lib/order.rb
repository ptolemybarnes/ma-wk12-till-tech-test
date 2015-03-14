require './lib/modules/percentage'

class Order
  attr_reader   :name, :cost
  attr_accessor :price, :discount
  
  def initialize(options = {})
    @name     = options[:name] 
    @price    = options[:price]
    @discount = options[:discount] || "0%"
  end

  def cost 
    @price - (@discount.percent_of @price)
  end

  def discount_multiplier
   1-(discount.to_f/100)
  end

  def print value=nil
    { name: name, price: price, cost: cost, discount: discount } 
  end

end

