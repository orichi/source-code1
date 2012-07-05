class AddSeqToCategory < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.integer :seq
    end
  end

  def self.down
    change_table :categories do |t|
      t.remove :seq
    end
  end
end
