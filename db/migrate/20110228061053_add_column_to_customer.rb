class AddColumnToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers,:actives,:boolean,:default=>0
    add_column :customers,:randkey,:string
  end

  def self.down
    remove_column :customers,:actives
    remove_column :customers,:randkey
  end
end
