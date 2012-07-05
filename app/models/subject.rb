class Subject < ActiveRecord::Base
  belongs_to :variety
  belongs_to :image

  def image_file=(file)
    self.image = Image.create!(:data => file)
  end

  def business
    variety.business
  end
end
