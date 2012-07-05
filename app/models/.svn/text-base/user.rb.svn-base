class User < ActiveRecord::Base

  def self.auth(name, password)
    user = User.find_by_name_and_password(name, password)
    user.blank? ? false : user
  end
  
end
