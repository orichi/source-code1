class Group < ActiveRecord::Base
  has_many :collections

  def self.[](key)
    where(:key => key).first
  end
end
