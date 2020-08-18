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

ActiveRecord::Schema.define(version: 2020_08_18_190123) do

  create_table "add_ons", force: :cascade do |t|
    t.integer "pizza_id", null: false
    t.integer "topping_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pizza_id"], name: "index_add_ons_on_pizza_id"
    t.index ["topping_id"], name: "index_add_ons_on_topping_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "password"
    t.string "username"
  end

  create_table "orders", force: :cascade do |t|
    t.string "line_item"
    t.text "line_description"
    t.integer "quantity"
    t.integer "line_price"
    t.integer "total"
    t.datetime "date_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "size"
    t.string "crust"
    t.string "cheese"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pizza_id"
  end

  add_foreign_key "add_ons", "pizzas"
  add_foreign_key "add_ons", "toppings"
end
