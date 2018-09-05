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

ActiveRecord::Schema.define(version: 2018_09_04_051530) do

  create_table "consumptions", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "stay_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_consumptions_on_product_id"
    t.index ["stay_id"], name: "index_consumptions_on_stay_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "documento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "membership_id"
    t.index ["membership_id"], name: "index_guests_on_membership_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "nombre"
    t.float "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "nombre"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.float "price"
    t.integer "week_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["room_id"], name: "index_rates_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "number"
    t.integer "floor"
    t.integer "bed_number"
    t.integer "guests_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "avaliable"
  end

  create_table "stays", force: :cascade do |t|
    t.date "date_in"
    t.date "date_out"
    t.integer "guest_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_stays_on_guest_id"
    t.index ["room_id"], name: "index_stays_on_room_id"
  end

end
