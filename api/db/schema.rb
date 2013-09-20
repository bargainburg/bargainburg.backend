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

ActiveRecord::Schema.define(version: 20130920222503) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_date"
    t.string   "description"
    t.string   "image"
    t.boolean  "hidden"
    t.string   "name"
    t.integer  "category_id"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "hours"
    t.string   "link"
    t.string   "description"
    t.boolean  "approved"
    t.integer  "price_range"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "point_of_contacts", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
