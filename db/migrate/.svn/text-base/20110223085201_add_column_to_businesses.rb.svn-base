class AddColumnToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses,:money,:decimal,:precision=>12,:scale=>2
    add_column :customers,:leval,:integer,:default=>2
  end

  def self.down
    remove_column :businesses,:money
    remove_column :customers,:leval
  end
end
