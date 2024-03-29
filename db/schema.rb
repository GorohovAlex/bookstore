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

ActiveRecord::Schema.define(version: 2020_05_06_121045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "type", null: false
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.string "address", limit: 50, null: false
    t.string "city", limit: 50, null: false
    t.string "zip", limit: 10, null: false
    t.string "country", limit: 50, null: false
    t.string "phone", limit: 15, null: false
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "owner_type"
    t.index ["owner_id", "type"], name: "index_addresses_on_owner_id_and_type", unique: true
    t.index ["owner_id"], name: "index_addresses_on_owner_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "best_sellers", force: :cascade do |t|
    t.bigint "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_best_sellers_on_book_id"
  end

  create_table "book_authors", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "book_dimensions", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.decimal "height", precision: 6, scale: 1
    t.decimal "width", precision: 6, scale: 1
    t.decimal "depth", precision: 6, scale: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_dimensions_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.string "description"
    t.integer "year_of_publication"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.integer "order_items_count"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "books_materials", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "material_id"
    t.index ["book_id"], name: "index_books_materials_on_book_id"
    t.index ["material_id"], name: "index_books_materials_on_material_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "user_id"
    t.string "session_id"
    t.bigint "book_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_cart_items_on_book_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "books_count"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.integer "count"
    t.integer "discount"
    t.boolean "enabled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_coupons_on_name", unique: true
  end

  create_table "covers", force: :cascade do |t|
    t.bigint "book_id"
    t.text "image_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_covers_on_book_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "name"
    t.text "days"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_cards", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.string "date_expiry"
    t.string "cvv"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_cards_on_order_id"
  end

  create_table "order_deliveries", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "delivery_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_id"], name: "index_order_deliveries_on_delivery_id"
    t.index ["order_id"], name: "index_order_deliveries_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "book_id"
    t.string "name"
    t.integer "quantity"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.integer "total_cents", default: 0, null: false
    t.string "total_currency", default: "EUR", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_summaries", force: :cascade do |t|
    t.bigint "order_id"
    t.string "item_name"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_summaries_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "aasm_state"
    t.string "number"
    t.boolean "use_billing_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false
    t.string "review", null: false
    t.integer "rating", null: false
    t.integer "status", default: 0, null: false
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "best_sellers", "books", on_delete: :cascade
  add_foreign_key "book_authors", "authors", on_delete: :cascade
  add_foreign_key "book_authors", "books", on_delete: :cascade
  add_foreign_key "book_dimensions", "books"
  add_foreign_key "books", "categories", on_delete: :nullify
  add_foreign_key "books_materials", "books", on_delete: :cascade
  add_foreign_key "books_materials", "materials", on_delete: :cascade
  add_foreign_key "cart_items", "books"
  add_foreign_key "cart_items", "users"
  add_foreign_key "covers", "books", on_delete: :cascade
  add_foreign_key "order_cards", "orders", on_delete: :cascade
  add_foreign_key "order_deliveries", "orders", on_delete: :cascade
  add_foreign_key "order_items", "books", on_delete: :cascade
  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "order_summaries", "orders", on_delete: :cascade
  add_foreign_key "orders", "users", on_delete: :cascade
  add_foreign_key "reviews", "books", on_delete: :cascade
  add_foreign_key "reviews", "users", on_delete: :cascade
end
