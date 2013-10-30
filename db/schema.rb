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

ActiveRecord::Schema.define(version: 20131014205503) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.datetime "begin_date"
    t.datetime "end_date"
    t.text     "description"
    t.boolean  "hidden"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "merchant_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "hours"
    t.string   "link"
    t.text     "description"
    t.boolean  "approved"
    t.integer  "price_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "address"
  end

  add_index "merchants", ["user_id"], name: "index_merchants_on_user_id"

  create_table "point_of_contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merchant_id"
  end

<<<<<<< HEAD
  create_table "searches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

=======
>>>>>>> format
  create_table "users", force: true do |t|
    t.string   "email",                          null: false
    t.string   "password_digest",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token",              null: false
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

end
