class Collection < ActiveRecord::Base
  has_and_belongs_to_many :businesses
  belongs_to :group

  def other_collections(n)
    group.collections.where("id != #{id}").limit(n)
  end
end
