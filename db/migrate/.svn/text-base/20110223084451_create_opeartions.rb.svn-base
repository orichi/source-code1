class CreateOpeartions < ActiveRecord::Migration
  def self.up
    create_table :opeartions do |t|
      t.integer :serial_no
      t.string :record_type
      t.string :message
      t.integer :customer_id
      t.integer :business_id
      t.decimal :score,:default=>0,:precision=>12,:scale=>2
      t.decimal :money,:default=>0,:precision=>12,:scale=>2
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :opeartions
  end
end
