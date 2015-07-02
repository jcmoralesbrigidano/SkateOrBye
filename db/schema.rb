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

ActiveRecord::Schema.define(version: 20150701232440) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "jam_id"
    t.integer  "skater_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "challenger_id"
    t.integer  "skater_id"
    t.integer  "challenge_spot"
    t.string   "challenge"
    t.float    "score"
    t.string   "state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "jams", force: :cascade do |t|
    t.string   "name"
    t.integer  "spot_id"
    t.date     "date"
    t.time     "time"
    t.string   "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jams_skaters", id: false, force: :cascade do |t|
    t.integer "jam_id"
    t.integer "skater_id"
  end

  add_index "jams_skaters", ["jam_id"], name: "index_jams_skaters_on_jam_id"
  add_index "jams_skaters", ["skater_id"], name: "index_jams_skaters_on_skater_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "trick_id"
    t.integer  "skater_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skaters", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "spots", force: :cascade do |t|
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "level"
    t.string   "floor_quality"
    t.string   "teachers"
    t.string   "photo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tricks", force: :cascade do |t|
    t.integer  "skater_id"
    t.integer  "spot_id"
    t.string   "video"
    t.float    "average_rating"
    t.integer  "challenge_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
