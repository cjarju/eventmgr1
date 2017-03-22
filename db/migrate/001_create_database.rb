class CreateDatabase < ActiveRecord::Migration
  def self.up
    # insert schema.rb here
	  create_table "event_dates", force: :cascade do |t|
		t.integer  "event_id",   limit: 4
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
		t.integer  "event_id",     limit: 4,   null: false
		t.integer  "item_type_id", limit: 4,   null: false
		t.string   "description",  limit: 255
		t.datetime "created_at",               null: false
		t.datetime "updated_at",               null: false
	  end

	  create_table "event_items", force: :cascade do |t|
		t.integer  "event_id",       limit: 4,                                         null: false
		t.integer  "item_id",        limit: 4,                                         null: false
		t.integer  "quantity",       limit: 4,                           default: 1,   null: false
		t.integer  "days",           limit: 4,                           default: 1,   null: false
		t.decimal  "cost1_per_unit",            precision: 11, scale: 2
		t.decimal  "cost2_per_unit",            precision: 11, scale: 2
		t.decimal  "cost3_per_unit",            precision: 11, scale: 2
		t.float    "width",          limit: 24,                          default: 1.0, null: false
		t.float    "height",         limit: 24,                          default: 1.0, null: false
		t.datetime "created_at",                                                       null: false
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
		t.integer  "event_type_id",      limit: 4,    null: false
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
		t.integer  "item_type_id",   limit: 4,                                          null: false
		t.float    "width",          limit: 24,                           default: 1.0, null: false
		t.float    "height",         limit: 24,                           default: 1.0, null: false
		t.datetime "created_at",                                                        null: false
		t.datetime "updated_at"
	  end

	  create_table "user_roles", force: :cascade do |t|
		t.string   "name",       limit: 100
		t.datetime "created_at"
		t.datetime "updated_at"
	  end

	  create_table "users", force: :cascade do |t|
		t.integer  "user_role_id",    limit: 4
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

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end