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

ActiveRecord::Schema.define(version: 20141027172519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "password_resets", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "password_resets", ["user_id"], name: "index_password_resets_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "shop_name"
    t.string   "phone"
    t.text     "address"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "rating"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["profile_id"], name: "index_reviews_on_profile_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "fname",                           null: false
    t.string   "lname",                           null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "barber",          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
