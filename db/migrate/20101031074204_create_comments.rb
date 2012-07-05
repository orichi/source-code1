class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :level
      t.text :content
      t.integer :created_by_id
      t.integer :business_id
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
