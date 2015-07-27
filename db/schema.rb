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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150727082312) do

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.text     "item_description"
    t.string   "item_type"
    t.integer  "item_time"
    t.float    "item_price"
    t.string   "item_image"
    t.integer  "restaurant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.float    "total"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "table_id"
    t.string   "state"
  end

  add_index "orders", ["restaurant_id"], name: "index_orders_on_restaurant_id"
  add_index "orders", ["table_id"], name: "index_orders_on_table_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name"
    t.text     "restaurant_description"
    t.string   "restaurant_type"
    t.string   "restaurant_address"
    t.string   "restaurant_phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tables", force: :cascade do |t|
    t.integer  "number"
    t.string   "state"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tables", ["restaurant_id"], name: "index_tables_on_restaurant_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "restaurant_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["restaurant_id"], name: "index_users_on_restaurant_id"

end
