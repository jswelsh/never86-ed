# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_05_180325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "organization_id"], name: "index_bars_on_name_and_organization_id", unique: true
    t.index ["organization_id"], name: "index_bars_on_organization_id"
  end

  create_table "bottle_readings", force: :cascade do |t|
    t.time "reading_time"
    t.decimal "fill", precision: 5, scale: 2
    t.bigint "bottle_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["bottle_id", "reading_time"], name: "index_bottle_readings_on_bottle_id_and_reading_time", unique: true, order: { reading_time: :desc }
    t.index ["bottle_id"], name: "index_bottle_readings_on_bottle_id"
    t.index ["status"], name: "index_bottle_readings_on_status"
    t.index ["user_id"], name: "index_bottle_readings_on_user_id"
  end

  create_table "bottles", force: :cascade do |t|
    t.bigint "bar_id", null: false
    t.bigint "liquor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bar_id", "liquor_id"], name: "index_bottles_on_bar_id_and_liquor_id", unique: true
    t.index ["bar_id"], name: "index_bottles_on_bar_id"
    t.index ["liquor_id"], name: "index_bottles_on_liquor_id"
  end

  create_table "liquors", force: :cascade do |t|
    t.string "spirit", null: false
    t.string "brand", null: false
    t.string "name"
    t.integer "capacity", null: false
    t.decimal "cost", precision: 5, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand", "name", "capacity"], name: "index_liquors_on_brand_and_name_and_capacity", unique: true
    t.index ["spirit", "brand", "name", "capacity"], name: "index_liquors_on_spirit_and_brand_and_name_and_capacity", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "bars", "organizations"
  add_foreign_key "bottle_readings", "bottles"
  add_foreign_key "bottle_readings", "users"
  add_foreign_key "bottles", "bars"
  add_foreign_key "bottles", "liquors"
  add_foreign_key "users", "organizations"
end
