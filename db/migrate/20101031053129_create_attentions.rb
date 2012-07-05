class CreateAttentions < ActiveRecord::Migration
  def self.up
    create_table :attentions do |t|
      t.integer :business_id
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attentions
  end
end
