class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.integer :enum_id
      t.string :name
      t.string :key

    end
  end

  def self.down
    drop_table :options
  end
end
