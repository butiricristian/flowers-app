# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_28_061859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flowers_orders", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "flower_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flower_id"], name: "index_flowers_orders_on_flower_id"
    t.index ["order_id", "flower_id"], name: "index_flowers_orders_on_order_id_and_flower_id", unique: true
    t.index ["order_id"], name: "index_flowers_orders_on_order_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.integer "status"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_orders_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "flowers_orders", "flowers"
  add_foreign_key "flowers_orders", "orders"
  add_foreign_key "orders", "users", column: "creator_id"
end
