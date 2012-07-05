class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.string :name
      t.integer :group_id
      t.string :key

    end
  end

  def self.down
    drop_table :collections
  end
end
