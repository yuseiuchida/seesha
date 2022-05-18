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

ActiveRecord::Schema.define(version: 2022_04_20_053407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.uuid "user_id"
    t.bigint "combination_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combination_id"], name: "index_bookmarks_on_combination_id"
    t.index ["user_id", "combination_id"], name: "index_bookmarks_on_user_id_and_combination_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coefficients", force: :cascade do |t|
    t.bigint "combination_id"
    t.float "sweet", default: 1.0
    t.float "refresh", default: 1.0
    t.float "relax", default: 1.0
    t.float "easy", default: 1.0
    t.float "rating", default: 1.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combination_id"], name: "index_coefficients_on_combination_id"
  end

  create_table "combinations", force: :cascade do |t|
    t.bigint "first_flavor_id"
    t.bigint "second_flavor_id"
    t.bigint "third_flavor_id"
    t.bigint "fourth_flavor_id"
    t.integer "total_flavors"
    t.string "status"
    t.string "name"
    t.integer "rating_score", null: false
    t.integer "sweet_score", null: false
    t.integer "refresh_score", null: false
    t.integer "relax_score", null: false
    t.integer "easy_score", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_flavor_id", "second_flavor_id", "third_flavor_id", "fourth_flavor_id"], name: "combinations_index", unique: true
    t.index ["first_flavor_id"], name: "index_combinations_on_first_flavor_id"
    t.index ["fourth_flavor_id"], name: "index_combinations_on_fourth_flavor_id"
    t.index ["second_flavor_id"], name: "index_combinations_on_second_flavor_id"
    t.index ["third_flavor_id"], name: "index_combinations_on_third_flavor_id"
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id"
    t.string "flavor_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_flavors_on_category_id"
  end

  create_table "inquiries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "kind", null: false
    t.string "user_name"
    t.string "user_email"
    t.string "content", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "combination_id"
    t.float "sweet_rate"
    t.float "refresh_rate"
    t.float "relax_rate"
    t.float "easy_rate"
    t.float "rating_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combination_id"], name: "index_rates_on_combination_id"
  end

  create_table "review_combinations", force: :cascade do |t|
    t.bigint "combination_id"
    t.uuid "user_id"
    t.string "sweet"
    t.string "refresh"
    t.string "relax"
    t.string "easy"
    t.string "rating", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combination_id"], name: "index_review_combinations_on_combination_id"
    t.index ["user_id"], name: "index_review_combinations_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "bookmarks", "combinations"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "coefficients", "combinations"
  add_foreign_key "rates", "combinations"
  add_foreign_key "review_combinations", "combinations"
  add_foreign_key "review_combinations", "users"
end
