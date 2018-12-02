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

ActiveRecord::Schema.define(version: 20181202163425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hitlogs", force: :cascade do |t|
    t.string "ip"
    t.string "city"
    t.string "country"
    t.bigint "shorten_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shorten_id"], name: "index_hitlogs_on_shorten_id"
  end

  create_table "shortens", force: :cascade do |t|
    t.string "short_url"
    t.string "real_url"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_shortens_on_id"
    t.index ["short_url"], name: "index_shortens_on_short_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "hitlogs", "shortens"
end
