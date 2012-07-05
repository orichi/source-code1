class AddFocusCountry < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.integer :focus_country_id
    end
  end

  def self.down
    change_table :customers do |t|
      t.remove :focus_country_id
    end
  end
end
