class CreateOrderforms < ActiveRecord::Migration
  def self.up
    create_table :orderforms do |t|
      t.string :serial_no
      t.integer :customer_id
      t.boolean :paid
      t.date :paid_at

      t.timestamps
    end
  end

  def self.down
    drop_table :orderforms
  end
end
