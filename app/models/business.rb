class Business < ActiveRecord::Base
  validates :name, :category_id, :county_id, :phone, :presence => true
   
  has_and_belongs_to_many :collections
  belongs_to :image
  belongs_to :category
  belongs_to :county, :class_name => "Option", :foreign_key => "county_id"
  has_many :attentions, :dependent => :destroy
  has_many :customers, :through => :attentions
  has_many :comments, :dependent => :destroy
  has_many :varieties, :dependent => :destroy
  has_many :subjects, :through => :varieties
  has_many :activities, :dependent => :destroy

  scope :recommends, :conditions => {:recommend => true, :active => true}
  scope :lasts, lambda { |n| where(:active => true).order("updated_at desc").limit(n) }

  def doing_activity
    activities.where(["begin_at <= :now < end_at", {:now => Time.now}]).first
  end

  def doing_activity?
    !doing_activity.blank?
  end

  def in_collections(name)
    collections.where({:group_id => Group[name].id})
  end

  def self.candidates(category)
    where(:active => true)
  end

  def self.flat_in_category(category_id)
    where(["(category_id = :cat_id or category_id in (select id from categories where parent_id = :cat_id)) and active = :active", {:cat_id => category_id, :active => true}])
  end

  def image_file=(file)
    self.image = Image.create!(:data => file)
  end

  def category_txt
    unless (category.parent.blank?)
      "#{category.parent.name} > #{category.name}"
    else
      category.name
    end
  end
  
  def collections_txt
    collections.inject("") { |txt, coll| txt = txt + coll.name + ", "}
  end

  def self.auth(name, password)
    user = Business.find_by_name_and_password(name, password)
    user.blank? ? false : user
  end

  def calculate_level
    ave_l = comments.average(:level) || 0;
    (ave_l - ave_l.to_i > 0.5) ? ave_l.to_i + 1 : ave_l.to_i
  end

  def newest_comments(n)
    comments.order("id desc").limit(n)
  end

  def self.hotests
    where(:active => true).order("level desc")
  end

  def parent_category_id
    unless category.blank?
      return category.id if category.root?
      category.parent_id
    end
  end

  def parent_category_id=(p_id)
    #什么都不做
  end

end
