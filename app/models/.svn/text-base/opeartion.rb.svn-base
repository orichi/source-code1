class Opeartion < ActiveRecord::Base
  belongs_to :customer
  belongs_to :business

  def self.seekrecord(seektype,value)
    case seektype
    when "customer_id"
      order("id desc").find_all_by_customer_id(value)
    when "business_id"
      order("id desc").find_all_by_business_id(value)
    end
  end
end
