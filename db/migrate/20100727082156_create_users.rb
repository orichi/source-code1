class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :limit => 30
      t.string :name, :limit => 10
      t.string :password, :limit => 20
      t.string :superpasswd, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
