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

ActiveRecord::Schema.define(version: 20151027135854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.text     "event_name"
    t.text     "event_date"
    t.text     "event_time"
    t.text     "event_desc"
    t.text     "event_category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "events", ["event_name"], name: "index_events_on_event_name", unique: true, using: :btree

  create_table "post_tags", force: :cascade do |t|
    t.string   "tag"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "post_status"
    t.string   "read_count"
    t.string   "post_title"
    t.text     "post_content"
    t.string   "slug"
    t.string   "by_line"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "post_type"
  end

  add_index "posts", ["post_title"], name: "index_posts_on_post_title", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "area"
    t.string   "engagement"
    t.text     "email"
    t.string   "slug"
    t.string   "referrer"
    t.string   "additional_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteers", ["email"], name: "index_volunteers_on_email", unique: true, using: :btree
  add_index "volunteers", ["slug"], name: "index_volunteers_on_slug", unique: true, using: :btree

end
