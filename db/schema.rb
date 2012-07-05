# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110301015841) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.decimal  "price",        :precision => 10, :scale => 0, :default => 0
    t.text     "introduction"
    t.integer  "image_id"
    t.integer  "business_id"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publish"
  end

  create_table "activities_subjects", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "subject_id"
  end

  create_table "activity_orders", :force => true do |t|
    t.integer  "serial_no"
    t.integer  "customer_id"
    t.integer  "activity_id"
    t.boolean  "paid"
    t.datetime "paid_at"
    t.decimal  "totalmoney",  :precision => 16, :scale => 2
    t.decimal  "paidmoney",   :precision => 16, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attentions", :force => true do |t|
    t.integer  "business_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "email"
    t.string   "manager"
    t.string   "manager_phone"
    t.string   "address"
    t.string   "phone"
    t.decimal  "balance",        :precision => 10, :scale => 2, :default => 0.0
    t.integer  "score",                                         :default => 0
    t.integer  "focus_count",                                   :default => 0
    t.text     "introduction"
    t.string   "promise"
    t.boolean  "vip",                                           :default => false
    t.boolean  "recommend",                                     :default => false
    t.integer  "image_id"
    t.string   "password"
    t.integer  "comments_count",                                :default => 0
    t.integer  "level",                                         :default => 0
    t.string   "open_at"
    t.string   "close_at"
    t.integer  "county_id"
    t.string   "near_to"
    t.text     "traffic"
    t.text     "delivery"
    t.integer  "avg_consume"
    t.string   "park_info"
    t.boolean  "active",                                        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "mapcode"
    t.decimal  "money",          :precision => 12, :scale => 2
  end

  create_table "businesses_collections", :id => false, :force => true do |t|
    t.integer "collection_id"
    t.integer "business_id"
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.string  "key"
    t.integer "parent_id"
    t.integer "seq"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "collections", :force => true do |t|
    t.string  "name"
    t.integer "group_id"
    t.string  "key"
  end

  create_table "comments", :force => true do |t|
    t.integer  "level"
    t.text     "content"
    t.integer  "created_by_id"
    t.integer  "business_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "nickname"
    t.string   "referralno"
    t.string   "password"
    t.string   "address"
    t.string   "phone"
    t.integer  "score",            :default => 0
    t.integer  "image_id"
    t.string   "image_path"
    t.integer  "gender_id"
    t.string   "company"
    t.string   "industry"
    t.string   "worktitle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "focus_country_id"
    t.integer  "leval",            :default => 2
    t.boolean  "actives",          :default => false
    t.string   "randkey"
  end

  create_table "discount_rules", :force => true do |t|
    t.integer "activity_id"
    t.integer "count"
    t.integer "percent"
  end

  create_table "enums", :force => true do |t|
    t.string "name", :limit => 50
  end

  create_table "groups", :force => true do |t|
    t.string "name"
    t.string "key"
  end

  create_table "images", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "resource_id"
    t.string   "resource_type"
  end

  create_table "msgs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.text     "content"
    t.integer  "customer_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opeartions", :force => true do |t|
    t.integer  "serial_no"
    t.string   "record_type"
    t.string   "message"
    t.integer  "customer_id"
    t.integer  "business_id"
    t.decimal  "score",       :precision => 12, :scale => 2, :default => 0.0
    t.decimal  "money",       :precision => 12, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", :force => true do |t|
    t.integer "enum_id"
    t.string  "name"
    t.string  "key"
  end

  create_table "orderforms", :force => true do |t|
    t.string   "serial_no"
    t.integer  "customer_id"
    t.boolean  "paid"
    t.date     "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "totalmoney",  :precision => 10, :scale => 2
    t.decimal  "paidmoney",   :precision => 10, :scale => 2
  end

  create_table "orderlines", :force => true do |t|
    t.integer "orderform_id"
    t.integer "subject_id"
    t.string  "subject_name", :limit => 100
    t.decimal "price",                       :precision => 10, :scale => 2
    t.integer "quantity"
  end

  create_table "partakes", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string  "name"
    t.integer "image_id"
    t.decimal "price",      :precision => 10, :scale => 0, :default => 0
    t.integer "variety_id"
    t.text    "content"
  end

  create_table "takemoneies", :force => true do |t|
    t.decimal  "money",       :precision => 10, :scale => 2
    t.integer  "business_id"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "paid_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",       :limit => 30
    t.string   "name",        :limit => 10
    t.string   "password",    :limit => 20
    t.string   "superpasswd", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "varieties", :force => true do |t|
    t.string  "name"
    t.integer "business_id"
  end

end
