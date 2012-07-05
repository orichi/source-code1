class CreateActivityOrders < ActiveRecord::Migration
  def self.up
    create_table :activity_orders do |t|
      t.integer :serial_no
      t.integer :customer_id
      t.integer :activity_id
      t.boolean :paid
      t.datetime :paid_at
      t.decimal :totalmoney,:precision => 16, :scale => 2
      t.decimal :paidmoney,:precision => 16, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :activity_orders
  end
end
