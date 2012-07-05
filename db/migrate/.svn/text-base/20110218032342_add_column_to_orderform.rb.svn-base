class AddColumnToOrderform < ActiveRecord::Migration
  def self.up
    add_column :orderforms,:totalmoney,:decimal,:precision => 10, :scale => 2
    add_column :orderforms,:paidmoney,:decimal,:precision => 10, :scale => 2
  end

  def self.down
    remove_column :orderforms,:totalmoney
    remove_column :orderforms,:paidmoney
  end
end
