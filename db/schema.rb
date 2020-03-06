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

ActiveRecord::Schema.define(version: 2020_02_19_164747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "formations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.string "picture_url"
    t.string "categorie"
    t.integer "session"
    t.integer "ref"
    t.date "sale"
    t.string "tag"
    t.string "campus"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "user_id"
    t.index ["users_id"], name: "index_formations_on_users_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "formation_id"
    t.bigint "order_id"
    t.integer "quantity"
    t.string "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["formation_id"], name: "index_line_items_on_formation_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "siret"
    t.string "adress"
    t.string "city"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_company"
    t.boolean "is_kid"
    t.boolean "is_admin"
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "avatarpicture"
    t.date "dateofbirth"
    t.string "siret"
    t.string "adress"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "mobile"
    t.string "fb_user_ID"
    t.string "insta_user_ID"
    t.string "insurance_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "users"
  add_foreign_key "formations", "users", column: "users_id"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "formations"
  add_foreign_key "line_items", "orders"
  add_foreign_key "orders", "users"
end
