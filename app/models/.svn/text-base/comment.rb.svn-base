class Comment < ActiveRecord::Base
  acts_as_tree
  belongs_to :business, :counter_cache => true
  belongs_to :created_by, :polymorphic => true
#  belongs_to :created_by, :class_name => "Customer", :foreign_key => "created_by_id"

  def source_content=(con)
    self.content = con.gsub(/<.*?>/,'').gsub(/\n/, "<br/>")
  end

  def self.newest(n)
    where("business_id is not null").order("id desc").limit(n)
  end
end
