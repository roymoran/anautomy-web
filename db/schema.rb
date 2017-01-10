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

ActiveRecord::Schema.define(version: 20170110063823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_makes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "year_1984",  default: false
    t.boolean  "year_1985",  default: false
    t.boolean  "year_1986",  default: false
    t.boolean  "year_1987",  default: false
    t.boolean  "year_1988",  default: false
    t.boolean  "year_1989",  default: false
    t.boolean  "year_1990",  default: false
    t.boolean  "year_1991",  default: false
    t.boolean  "year_1992",  default: false
    t.boolean  "year_1993",  default: false
    t.boolean  "year_1994",  default: false
    t.boolean  "year_1995",  default: false
    t.boolean  "year_1996",  default: false
    t.boolean  "year_1997",  default: false
    t.boolean  "year_1998",  default: false
    t.boolean  "year_1999",  default: false
    t.boolean  "year_2000",  default: false
    t.boolean  "year_2001",  default: false
    t.boolean  "year_2002",  default: false
    t.boolean  "year_2003",  default: false
    t.boolean  "year_2004",  default: false
    t.boolean  "year_2005",  default: false
    t.boolean  "year_2006",  default: false
    t.boolean  "year_2007",  default: false
    t.boolean  "year_2008",  default: false
    t.boolean  "year_2009",  default: false
    t.boolean  "year_2010",  default: false
    t.boolean  "year_2011",  default: false
    t.boolean  "year_2012",  default: false
    t.boolean  "year_2013",  default: false
    t.boolean  "year_2014",  default: false
    t.boolean  "year_2015",  default: false
    t.boolean  "year_2016",  default: false
    t.boolean  "year_2017",  default: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "car_make_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "year_1984",   default: false
    t.boolean  "year_1985",   default: false
    t.boolean  "year_1986",   default: false
    t.boolean  "year_1987",   default: false
    t.boolean  "year_1988",   default: false
    t.boolean  "year_1989",   default: false
    t.boolean  "year_1990",   default: false
    t.boolean  "year_1991",   default: false
    t.boolean  "year_1992",   default: false
    t.boolean  "year_1993",   default: false
    t.boolean  "year_1994",   default: false
    t.boolean  "year_1995",   default: false
    t.boolean  "year_1996",   default: false
    t.boolean  "year_1997",   default: false
    t.boolean  "year_1998",   default: false
    t.boolean  "year_1999",   default: false
    t.boolean  "year_2000",   default: false
    t.boolean  "year_2001",   default: false
    t.boolean  "year_2002",   default: false
    t.boolean  "year_2003",   default: false
    t.boolean  "year_2004",   default: false
    t.boolean  "year_2005",   default: false
    t.boolean  "year_2006",   default: false
    t.boolean  "year_2007",   default: false
    t.boolean  "year_2008",   default: false
    t.boolean  "year_2009",   default: false
    t.boolean  "year_2010",   default: false
    t.boolean  "year_2011",   default: false
    t.boolean  "year_2012",   default: false
    t.boolean  "year_2013",   default: false
    t.boolean  "year_2014",   default: false
    t.boolean  "year_2015",   default: false
    t.boolean  "year_2016",   default: false
    t.boolean  "year_2017",   default: false
  end

  add_index "car_models", ["car_make_id"], name: "index_car_models_on_car_make_id", using: :btree

  create_table "car_owners", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.integer  "cars_count",        default: 0
  end

  add_index "car_owners", ["email"], name: "index_car_owners_on_email", unique: true, using: :btree

  create_table "car_years", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "car_make_id"
    t.integer  "car_model_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "repair_submission_id"
    t.integer  "car_year_id"
    t.integer  "car_owner_id"
  end

  add_index "cars", ["car_make_id"], name: "index_cars_on_car_make_id", using: :btree
  add_index "cars", ["car_model_id"], name: "index_cars_on_car_model_id", using: :btree
  add_index "cars", ["car_owner_id"], name: "index_cars_on_car_owner_id", using: :btree
  add_index "cars", ["car_year_id"], name: "index_cars_on_car_year_id", using: :btree
  add_index "cars", ["repair_submission_id"], name: "index_cars_on_repair_submission_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "invoice_image_file_name"
    t.string   "invoice_image_content_type"
    t.integer  "invoice_image_file_size"
    t.datetime "invoice_image_updated_at"
  end

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

  add_index "repair_names", ["repair_category_id"], name: "index_repair_names_on_repair_category_id", using: :btree

  create_table "repair_submissions", force: :cascade do |t|
    t.string   "email"
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

  add_index "repair_submissions", ["shop_id"], name: "index_repair_submissions_on_shop_id", using: :btree

  create_table "repairs", force: :cascade do |t|
    t.integer  "repair_submission_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "repair_category_id"
    t.integer  "repair_name_id"
    t.string   "repair_name_custom"
  end

  add_index "repairs", ["repair_category_id"], name: "index_repairs_on_repair_category_id", using: :btree
  add_index "repairs", ["repair_name_id"], name: "index_repairs_on_repair_name_id", using: :btree
  add_index "repairs", ["repair_submission_id"], name: "index_repairs_on_repair_submission_id", using: :btree

  create_table "shop_ratings", force: :cascade do |t|
    t.integer  "cost_rating"
    t.integer  "quality_rating"
    t.integer  "quickness_rating"
    t.integer  "shop_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "repair_submission_id"
  end

  add_index "shop_ratings", ["repair_submission_id"], name: "index_shop_ratings_on_repair_submission_id", using: :btree
  add_index "shop_ratings", ["shop_id"], name: "index_shop_ratings_on_shop_id", using: :btree

  create_table "shop_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "shop_id"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "shop_users", ["email"], name: "index_shop_users_on_email", unique: true, using: :btree
  add_index "shop_users", ["shop_id"], name: "index_shop_users_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "shop_name"
    t.string   "shop_zip"
    t.string   "shop_city"
    t.string   "shop_state_code"
    t.string   "shop_iso_country_code"
    t.string   "shop_neighborhood"
    t.string   "shop_address"
    t.boolean  "shop_claimed",             default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "shop_closed",              default: false
    t.string   "shop_phone"
    t.integer  "repair_submissions_count", default: 0
    t.float    "shop_master_rating"
    t.integer  "shop_ratings_count",       default: 0
    t.boolean  "missing_info",             default: false
    t.string   "shop_url"
    t.integer  "yelp_rc"
    t.string   "yelp_contact_date"
    t.string   "register_id"
    t.integer  "shop_users_count",         default: 0
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "zip"
  end

  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true, using: :btree

  add_foreign_key "car_models", "car_makes"
  add_foreign_key "cars", "car_makes"
  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "car_owners"
  add_foreign_key "cars", "car_years"
  add_foreign_key "cars", "repair_submissions"
  add_foreign_key "repair_names", "repair_categories"
  add_foreign_key "repair_submissions", "shops"
  add_foreign_key "repairs", "repair_categories"
  add_foreign_key "repairs", "repair_names"
  add_foreign_key "repairs", "repair_submissions"
  add_foreign_key "shop_ratings", "repair_submissions"
  add_foreign_key "shop_ratings", "shops"
  add_foreign_key "shop_users", "shops"
end
