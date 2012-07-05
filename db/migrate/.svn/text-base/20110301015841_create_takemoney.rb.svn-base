class CreateTakemoney < ActiveRecord::Migration
  def self.up
    create_table :takemoneies do |t|
      t.decimal :money,:precision=>10,:scale=>2
      t.integer :business_id
      t.boolean :paid
      t.datetime :created_at
      t.datetime :paid_at
    end
  end

  def self.down
    drop_table :takemoneies
  end
end
