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

ActiveRecord::Schema.define(version: 20141015181958) do

  create_table "dealers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "time_zone"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "email_domain"
  end

  create_table "demos", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "dealership"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.integer  "dealer_id"
    t.boolean  "active",                 default: true
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "department"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "weowe_forms", force: true do |t|
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_phone_mobile"
    t.string   "customer_email"
    t.datetime "custom_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stock_number"
    t.integer  "year"
    t.string   "make"
    t.datetime "sold_date"
    t.text     "theyowe_info"
    t.decimal  "dealer_total_value",       precision: 8, scale: 2
    t.decimal  "customer_total_value",     precision: 8, scale: 2
    t.string   "vehicle_model"
    t.string   "color"
    t.integer  "dealer_id"
    t.integer  "user_id"
    t.boolean  "pending",                                          default: true
    t.boolean  "completed",                                        default: false
    t.text     "description_1"
    t.integer  "quantity_1"
    t.decimal  "dealer_total_value_1",     precision: 8, scale: 2
    t.text     "description_2"
    t.integer  "quantity_2"
    t.decimal  "dealer_total_value_2",     precision: 8, scale: 2
    t.text     "description_3"
    t.integer  "quantity_3"
    t.decimal  "dealer_total_value_3",     precision: 8, scale: 2
    t.text     "description_4"
    t.integer  "quantity_4"
    t.decimal  "dealer_total_value_4",     precision: 8, scale: 2
    t.text     "description_5"
    t.integer  "quantity_5"
    t.decimal  "dealer_total_value_5",     precision: 8, scale: 2
    t.string   "approved_by"
    t.string   "completed_by"
    t.decimal  "dealer_wholesale",         precision: 8, scale: 2
    t.decimal  "dealer_wholesale_1",       precision: 8, scale: 2
    t.decimal  "dealer_wholesale_2",       precision: 8, scale: 2
    t.decimal  "dealer_wholesale_3",       precision: 8, scale: 2
    t.decimal  "dealer_wholesale_4",       precision: 8, scale: 2
    t.decimal  "dealer_wholesale_5",       precision: 8, scale: 2
    t.integer  "assigned_sales_person_id"
    t.decimal  "dealer_actual_1",          precision: 8, scale: 2
    t.decimal  "dealer_actual_2",          precision: 8, scale: 2
    t.decimal  "dealer_actual_3",          precision: 8, scale: 2
    t.decimal  "dealer_actual_4",          precision: 8, scale: 2
    t.decimal  "dealer_actual_5",          precision: 8, scale: 2
    t.decimal  "dealer_total_actual",      precision: 8, scale: 2
  end

end
