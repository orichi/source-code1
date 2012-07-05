class Orderline < ActiveRecord::Base
  belongs_to :orderform
  belongs_to :subject
end
