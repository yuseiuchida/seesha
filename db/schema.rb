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

ActiveRecord::Schema.define(version: 2022_04_07_105929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "combinations", force: :cascade do |t|
    t.bigint "first_flavor_id"
    t.bigint "second_flavor_id"
    t.string "content"
    t.string "keyword", null: false
    t.integer "score"
    t.string "status"
    t.integer "sweet_rate"
    t.integer "refresh_rate"
    t.integer "easy_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_flavor_id"], name: "index_combinations_on_first_flavor_id"
    t.index ["second_flavor_id"], name: "index_combinations_on_second_flavor_id"
  end

  create_table "compabilities", force: :cascade do |t|
    t.bigint "main_combination_id"
    t.bigint "sub_combination_id"
    t.string "kind", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_combination_id"], name: "index_compabilities_on_main_combination_id"
    t.index ["sub_combination_id"], name: "index_compabilities_on_sub_combination_id"
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_flavors_on_category_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "combination_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combination_id"], name: "index_likes_on_combination_id"
    t.index ["user_id", "combination_id"], name: "index_likes_on_user_id_and_combination_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "recommends", force: :cascade do |t|
    t.string "target", null: false
    t.string "taste", null: false
    t.string "refresh", null: false
    t.string "alcohol", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "review_combinations", force: :cascade do |t|
    t.bigint "combination_id"
    t.bigint "user_id"
    t.string "sweet"
    t.string "refresh"
    t.string "easy"
    t.string "opinion", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combination_id"], name: "index_review_combinations_on_combination_id"
    t.index ["user_id"], name: "index_review_combinations_on_user_id"
  end

  create_table "review_compabilities", force: :cascade do |t|
    t.bigint "compability_id"
    t.bigint "user_id"
    t.string "opinion", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["compability_id"], name: "index_review_compabilities_on_compability_id"
    t.index ["user_id"], name: "index_review_compabilities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "compabilities", "combinations", column: "main_combination_id"
  add_foreign_key "compabilities", "combinations", column: "sub_combination_id"
  add_foreign_key "likes", "combinations"
  add_foreign_key "likes", "users"
  add_foreign_key "review_combinations", "combinations"
  add_foreign_key "review_combinations", "users"
  add_foreign_key "review_compabilities", "compabilities"
  add_foreign_key "review_compabilities", "users"
end
