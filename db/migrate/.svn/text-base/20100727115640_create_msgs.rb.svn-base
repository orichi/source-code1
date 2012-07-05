class CreateMsgs < ActiveRecord::Migration
  def self.up
    create_table :msgs do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :msgs
  end
end
