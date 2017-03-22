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

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_dates", force: :cascade do |t|
    t.integer  "event_id"
    t.date     "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_dates", ["event_id"], name: "index_event_dates_on_event_id", using: :btree

  create_table "event_info_types", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at"
  end

  create_table "event_item_types", force: :cascade do |t|
    t.integer  "event_id",                 null: false
    t.integer  "item_type_id",             null: false
    t.string   "description",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "event_items", force: :cascade do |t|
    t.integer  "event_id",                                              null: false
    t.integer  "item_id",                                               null: false
    t.integer  "quantity",                                default: 1,   null: false
    t.integer  "days",                                    default: 1,   null: false
    t.decimal  "cost1_per_unit", precision: 11, scale: 2
    t.decimal  "cost2_per_unit", precision: 11, scale: 2
    t.decimal  "cost3_per_unit", precision: 11, scale: 2
    t.float    "width",                                   default: 1.0, null: false
    t.float    "height",                                  default: 1.0, null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at"
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "event_type_name", limit: 50, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.date     "date_requested",                  null: false
    t.string   "event_name",         limit: 100,  null: false
    t.string   "organizers",         limit: 100,  null: false
    t.string   "location",           limit: 100,  null: false
    t.string   "requested_by",       limit: 100,  null: false
    t.string   "perceived_benefits", limit: 1000, null: false
    t.string   "goodwill",           limit: 1000, null: false
    t.integer  "event_type_id",                   null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at"
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "item_type_name", limit: 100,                 null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at"
    t.string   "description",    limit: 255
    t.boolean  "has_dimensions",             default: false, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "item_name",      limit: 100,                                        null: false
    t.decimal  "cost1_per_unit",             precision: 11, scale: 2
    t.decimal  "cost2_per_unit",             precision: 11, scale: 2
    t.decimal  "cost3_per_unit",             precision: 11, scale: 2
    t.integer  "item_type_id",                                                      null: false
    t.float    "width",                                               default: 1.0, null: false
    t.float    "height",                                              default: 1.0, null: false
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_role_id"
    t.string   "name",            limit: 100
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["user_role_id"], name: "index_users_on_user_role_id", using: :btree

end
