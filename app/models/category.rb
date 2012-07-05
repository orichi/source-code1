class Category < ActiveRecord::Base
  acts_as_tree
  has_many :businesses
  default_scope order("seq asc")

  def self.[](key)
    find_by_key(key.to_s)
  end

  def root?
    parent_id.blank?
  end

  def other_categories(n)
    if root?
      children.limit(n)
    else
      parent.children.where("id != #{id}").limit(n)
    end
  end

  def self.options_arr
    opts = []
    root_categories.each do |cate|
      opts << [cate.name, cate.id]
      cate.subcategories.each do |subcate|
        opts << ["|----" + subcate.name, subcate.id]
      end
    end
    opts
  end
end
