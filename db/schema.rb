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

ActiveRecord::Schema.define(version: 20161007052802) do

  create_table "car_makes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "car_make_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "car_models", ["car_make_id"], name: "index_car_models_on_car_make_id"

  create_table "cars", force: :cascade do |t|
    t.integer  "car_make_id"
    t.integer  "car_model_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "repair_submission_id"
  end

  add_index "cars", ["car_make_id"], name: "index_cars_on_car_make_id"
  add_index "cars", ["car_model_id"], name: "index_cars_on_car_model_id"
  add_index "cars", ["repair_submission_id"], name: "index_cars_on_repair_submission_id"

  create_table "repair_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_names", force: :cascade do |t|
    t.string   "name"
    t.integer  "repair_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "repair_names", ["repair_category_id"], name: "index_repair_names_on_repair_category_id"

  create_table "repair_submissions", force: :cascade do |t|
    t.string   "email"
    t.integer  "vehicle_year"
    t.string   "vehicle_trim"
    t.string   "vehicle_mileage"
    t.string   "parts_cost"
    t.string   "labor_cost"
    t.text     "review"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "shop_id"
    t.string   "total_cost"
    t.date     "repair_date"
  end

  add_index "repair_submissions", ["shop_id"], name: "index_repair_submissions_on_shop_id"

  create_table "repairs", force: :cascade do |t|
    t.integer  "repair_submission_id"
    t.integer  "repair_category_id"
    t.integer  "repair_name_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "repairs", ["repair_category_id"], name: "index_repairs_on_repair_category_id"
  add_index "repairs", ["repair_name_id"], name: "index_repairs_on_repair_name_id"
  add_index "repairs", ["repair_submission_id"], name: "index_repairs_on_repair_submission_id"

  create_table "shops", force: :cascade do |t|
    t.string   "shop_name"
    t.string   "shop_zip"
    t.string   "shop_city"
    t.string   "shop_state_code"
    t.string   "shop_country_code"
    t.string   "shop_neighborhood"
    t.string   "shop_address"
    t.boolean  "shop_claimed",             default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "shop_closed",              default: false
    t.string   "shop_phone"
    t.integer  "repair_submissions_count", default: 0
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "zip"
  end

  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true

end
