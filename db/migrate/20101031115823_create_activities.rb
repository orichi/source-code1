class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name
      t.decimal :price, :default => 0
      t.text :introduction
      t.integer :image_id
      t.integer :business_id
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
