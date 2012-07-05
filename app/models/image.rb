class Image < ActiveRecord::Base
  has_attached_file  :data , :styles => { :medium => "150x150>", :thumb => "100x100>", :small => "50x50" },
              :path => ":rails_root/public/uploads/:class/:attachment/:id/:style_:id.:extension",
              :url => "/uploads/:class/:attachment/:id/:style_:id.:extension"

  belongs_to :resource, :polymorphic => true
end
