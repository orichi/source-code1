class Orderform < ActiveRecord::Base
  has_many :orderlines
  def total
    sum = 0
    self.orderlines.each do |line|
      sum += line.price * line.quantity
    end
    return sum
  end
end
