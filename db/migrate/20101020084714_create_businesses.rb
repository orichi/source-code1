class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.integer :category_id
      t.string :name
      t.string :email
      t.string :manager
      t.string :manager_phone
      t.string :address
      t.string :phone
      t.decimal :balance, :default => 0, :precision => 10, :scale => 2
      t.integer :score, :default => 0
      t.integer :focus_count, :default => 0
      t.text :introduction
      t.string :promise
      t.boolean :vip, :default => false
      t.boolean :recommend, :default => false
      t.integer :image_id
      t.string :password
      t.integer :comments_count, :default => 0
      t.integer :level, :default => 0
      t.string :open_at
      t.string :close_at

      t.integer :county_id
      t.string :near_to
      t.text :traffic
      t.text :delivery
      t.integer :avg_consume
      t.string :park_info
      t.boolean :active, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
