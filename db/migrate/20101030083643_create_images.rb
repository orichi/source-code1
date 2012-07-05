class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string  :data_file_name
      t.string  :data_content_type
      t.integer :data_file_size
      t.datetime   :data_updated_at

      t.integer :resource_id
      t.string :resource_type
    end
  end

  def self.down
    drop_table :images
  end
end
