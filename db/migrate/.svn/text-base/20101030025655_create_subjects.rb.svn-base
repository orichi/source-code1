class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :name
      t.integer :image_id
      t.decimal :price, :default => 0
      t.integer :variety_id
      t.text :content

    end
  end

  def self.down
    drop_table :subjects
  end
end
