class AddMapcodeToBusiness < ActiveRecord::Migration
  def self.up
    change_table :businesses do |t|
      t.text :mapcode
    end
  end

  def self.down
    change_table :businesses do |t|
      t.remove :mapcode
    end
  end
end
