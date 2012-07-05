class Enum < ActiveRecord::Base
  has_many :options, :dependent => :destroy

  def self.[](enum_name)
    first(:conditions =>["name = ?", enum_name.to_s])
  end

  def option(key)
    options.first(:conditions =>["`key` = ?", key.to_s])
  end
end
