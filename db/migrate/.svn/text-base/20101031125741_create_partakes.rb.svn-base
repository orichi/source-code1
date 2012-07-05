class CreatePartakes < ActiveRecord::Migration
  def self.up
    create_table :partakes do |t|
      t.integer :customer_id
      t.integer :activity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :partakes
  end
end
