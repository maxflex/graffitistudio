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

ActiveRecord::Schema.define(version: 20160420131935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.string   "answer"
    t.boolean  "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.boolean  "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frees", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "url_original"
  end

  create_table "linkdumps", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotes", force: :cascade do |t|
    t.string   "email"
    t.string   "url"
    t.string   "string"
    t.string   "desc"
    t.string   "subject"
    t.string   "fio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_pays", force: :cascade do |t|
    t.string   "field"
    t.string   "second_field"
    t.string   "thyrty_field"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "walls", force: :cascade do |t|
    t.string   "url"
    t.string   "desc"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
