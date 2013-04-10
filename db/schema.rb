# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120726033338) do

  create_table "application_receivers", :force => true do |t|
    t.integer  "application_id"
    t.integer  "user_id"
    t.string   "state"
    t.text     "reason"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "application_receivers", ["application_id"], :name => "index_application_receivers_on_application_id"
  add_index "application_receivers", ["user_id"], :name => "index_application_receivers_on_user_id"

  create_table "applications", :force => true do |t|
    t.string   "reason"
    t.integer  "sender"
    t.string   "type"
    t.integer  "sum"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "back_date"
    t.string   "use"
    t.string   "item_name"
    t.string   "state"
    t.string   "receive_payment_company"
    t.string   "contract_name"
    t.string   "purchase_company"
    t.string   "business_travel_destination"
    t.string   "real_end_at"
  end

  create_table "grants", :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "grants", ["right_id"], :name => "index_grants_on_right_id"
  add_index "grants", ["role_id"], :name => "index_grants_on_role_id"

  create_table "message_receivers", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  add_index "message_receivers", ["message_id"], :name => "index_message_receivers_on_message_id"
  add_index "message_receivers", ["user_id"], :name => "index_message_receivers_on_user_id"

  create_table "messages", :force => true do |t|
    t.string   "content"
    t.integer  "sender"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notices", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "notices", ["user_id"], :name => "index_notices_on_user_id"

  create_table "rights", :force => true do |t|
    t.string   "resource"
    t.string   "operation"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.string   "real_name"
    t.string   "position"
    t.integer  "parent_id"
  end

  create_table "work_logs", :force => true do |t|
    t.text     "content",    :limit => 255
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.datetime "log_date"
  end

  add_index "work_logs", ["user_id"], :name => "index_work_logs_on_user_id"

end
