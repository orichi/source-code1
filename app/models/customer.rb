class Customer < ActiveRecord::Base
  validates :email, :password, :presence => true
  validates_confirmation_of :password
  
  has_many :attentions, :dependent => :destroy
  has_many :businesses, :through => :attentions
  has_many :partakes, :dependent => :destroy
  has_many :activities, :through => :partakes
  has_many :notifications
  belongs_to :image
  belongs_to :gender, :class_name => "Option", :foreign_key => "gender_id"
  has_many :comments, :foreign_key => "created_by_id"
  belongs_to :focus_country, :class_name => "Collection", :foreign_key => "focus_country_id"
  
  def show_name
    nickname || email
  end

  def attented?(business)
    businesses.exists?(business)
  end

  def partaked?(activity)
    activities.exists?(activity)
  end

  def self.auth(email, password)
    user = Customer.find_by_email_and_password(email, password)
    user.blank? ? false : user
  end

  def image_file=(file)
    self.image = Image.create!(:data => file)
  end

  def rand_friends(n)
    Customer.where(["id != ?", id]).order("rand()").limit(n)
  end
end
