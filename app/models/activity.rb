class Activity < ActiveRecord::Base
  belongs_to :business
  has_and_belongs_to_many :subjects
  has_many :partakes, :dependent => :destroy
  has_many :customers, :through => :partakes
  has_many :discount_rules, :dependent => :destroy
  belongs_to :image

  scope :in_doings, lambda { where(["begin_at <= :now and end_at >= :now", {:now => Time.now}]).order("updated_at desc") }

#  def current_price
#    price * discount(customers.size)
#  end
#
#  def next_price
#    price*discount(Discount.find(self.id+1))
#  end
#
#  def final_price
#    100
#  end
#
  def discount(n)
    dis_rule = discount_rules.where(["count < ?", n]).order("count desc").first
    dis_rule.blank? ? 1 : (dis_rule.percent / 100)
  end

  def image_file=(file)
    self.image = Image.create!(:data => file)
  end
end
