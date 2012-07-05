class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :email
      t.string :name
      t.string :nickname
      t.string :referralno
      t.string :password
      t.string :address
      t.string :phone
      t.integer :score, :default => 0
      t.integer :image_id
      t.string :image_path
      t.integer :gender_id
      t.string :company
      t.string :industry
      t.string :worktitle
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
