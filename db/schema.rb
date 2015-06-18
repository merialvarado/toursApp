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

ActiveRecord::Schema.define(version: 20150616211948) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "number"
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "region_id"
    t.integer  "enterprise_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "addresses", ["enterprise_id"], name: "index_addresses_on_enterprise_id"
  add_index "addresses", ["region_id"], name: "index_addresses_on_region_id"

  create_table "enterprises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "region_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "phone_number"
    t.string   "postal_code"
  end

  add_index "enterprises", ["region_id"], name: "index_enterprises_on_region_id"
  add_index "enterprises", ["user_id"], name: "index_enterprises_on_user_id"

  create_table "events", force: :cascade do |t|
    t.text     "schedule"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["program_id"], name: "index_events_on_program_id"

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "picture"
    t.integer  "enterprise_id"
    t.decimal  "price",         precision: 5, scale: 2
  end

  add_index "programs", ["enterprise_id"], name: "index_programs_on_enterprise_id"
  add_index "programs", ["user_id"], name: "index_programs_on_user_id"

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "regions", ["province_id"], name: "index_regions_on_province_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
