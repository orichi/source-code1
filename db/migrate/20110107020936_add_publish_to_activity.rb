class AddPublishToActivity < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.boolean :publish
    end
  end

  def self.down
    change_table :activities do |t|
      t.remove :publish
    end
  end
end
