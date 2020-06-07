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

ActiveRecord::Schema.define(version: 2020_06_07_083649) do

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "member_id"
    t.string "shipping_address"
    t.string "postal_code"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "number_of_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "valid_invalid_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "genre_id"
    t.string "item_name"
    t.integer "unit_price_without_tax"
    t.integer "sale_status", default: 0
    t.text "explanation"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.integer "withdrawal_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "items_tax_included_price"
    t.integer "number_of_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "making_status", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.integer "postage"
    t.integer "payment_method"
    t.string "address"
    t.string "postal_code"
    t.string "name"
    t.integer "total_fee"
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

end
