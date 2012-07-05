class CreateEnums < ActiveRecord::Migration
  def self.up
    create_table :enums do |t|
     t.string :name, :limit => 50
    end
  end

  def self.down
    drop_table :enums
  end
end
