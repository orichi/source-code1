class Notification < ActiveRecord::Base
  belongs_to :activity
  belongs_to :resource, :polymorphic => true
end
