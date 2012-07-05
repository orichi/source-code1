class CreateOrderlines < ActiveRecord::Migration
  def self.up
    create_table :orderlines do |t|
      t.integer :orderform_id
      t.integer :subject_id
      t.string :subject_name, :limit => 100
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :quantity
    end
  end

  def self.down
    drop_table :orderlines
  end
end
