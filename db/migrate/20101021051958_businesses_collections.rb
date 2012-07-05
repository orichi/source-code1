class BusinessesCollections < ActiveRecord::Migration
  def self.up
    create_table :businesses_collections , :id =>false do |t|
      t.integer :collection_id
      t.integer :business_id
    end
  end

  def self.down
    drop_table :businesses_collections
  end
end
