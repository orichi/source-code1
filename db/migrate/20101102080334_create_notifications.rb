class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.text :content
      t.integer :customer_id

      t.integer :resource_id
      t.string :resource_type
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
