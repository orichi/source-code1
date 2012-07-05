class CreateDiscountRules < ActiveRecord::Migration
  def self.up
    create_table :discount_rules do |t|
      t.integer :activity_id
      t.integer :count
      t.integer :percent
    end
  end

  def self.down
    drop_table :discount_rules
  end
end
