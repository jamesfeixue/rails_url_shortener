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

ActiveRecord::Schema.define(version: 20160629210941) do

  create_table "shortened_urls", force: :cascade do |t|
    t.string  "long_url"
    t.string  "short_url"
    t.integer "user_id"
  end

  add_index "shortened_urls", ["long_url"], name: "index_shortened_urls_on_long_url", unique: true
  add_index "shortened_urls", ["short_url"], name: "index_shortened_urls_on_short_url", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visits", force: :cascade do |t|
    t.integer "visitor_id"
    t.string  "short_url"
  end

  add_index "visits", ["short_url"], name: "index_visits_on_short_url"
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id"

end
