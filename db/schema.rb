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

ActiveRecord::Schema.define(version: 20150507233309) do

  create_table "repair_submissions", force: :cascade do |t|
    t.string   "name"
    t.integer  "zip"
    t.string   "email"
    t.integer  "vehicleYear"
    t.string   "vehicleMake"
    t.string   "vehicleModel"
    t.string   "vehicleTrim"
    t.integer  "vehicleMileage"
    t.string   "repairDescription"
    t.string   "partsCost"
    t.string   "laborCost"
    t.string   "shopName"
    t.string   "shopCityState"
    t.text     "review"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "zip"
  end

  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true

end
