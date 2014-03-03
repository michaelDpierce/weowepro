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

ActiveRecord::Schema.define(version: 20140303005430) do

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weowe_forms", force: true do |t|
    t.integer  "weowe_id"
    t.integer  "duration"
    t.integer  "invoice_id"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_address_1"
    t.string   "customer_address_2"
    t.string   "customer_city"
    t.string   "customer_state"
    t.string   "customer_zip"
    t.string   "customer_phone_mobile"
    t.string   "customer_address"
    t.string   "customer_email"
    t.datetime "custom_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stock_number"
    t.integer  "year"
    t.string   "make"
    t.datetime "sold_date"
    t.string   "salesman_first_name"
    t.string   "salesman_last_name"
    t.text     "weowe_info"
    t.text     "theyowe_info"
    t.string   "salesman_signature"
    t.string   "customer_signature"
    t.decimal  "dealer_parts_value",    precision: 8, scale: 2
    t.decimal  "dealer_labor_value",    precision: 8, scale: 2
    t.decimal  "dealer_total_value",    precision: 8, scale: 2
    t.decimal  "customer_total_value",  precision: 8, scale: 2
    t.boolean  "status"
    t.string   "vehicle_model"
    t.string   "color"
  end

end
