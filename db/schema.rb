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

ActiveRecord::Schema.define(version: 20150617123807) do

  create_table "challenge_accepteds", force: :cascade do |t|
    t.integer  "skater_id"
    t.integer  "challenge_id"
    t.string   "state"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "challenge"
    t.integer  "challenge_spot"
    t.float    "score"
    t.integer  "skater_challenged"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rating"
    t.integer  "skater_id"
    t.integer  "trick_id"
  end

  create_table "skaters", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
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
    t.string   "video"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "spot_id"
    t.integer  "skater_id"
  end

end
