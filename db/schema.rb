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

ActiveRecord::Schema[7.0].define(version: 2022_09_18_092345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal "balance", precision: 8, scale: 2
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "coin_wallets", force: :cascade do |t|
    t.decimal "balance", precision: 8, scale: 2, default: "0.0"
    t.bigint "coin_id", null: false
    t.bigint "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_coin_wallets_on_coin_id"
    t.index ["wallet_id"], name: "index_coin_wallets_on_wallet_id"
  end

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "acronym"
  end

  create_table "operations", force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2
    t.integer "kind", default: 0
    t.bigint "wallet_origin_id", null: false
    t.bigint "wallet_destination_id", null: false
    t.bigint "coin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_operations_on_coin_id"
    t.index ["wallet_destination_id"], name: "index_operations_on_wallet_destination_id"
    t.index ["wallet_origin_id"], name: "index_operations_on_wallet_origin_id"
  end

  create_table "transitions", force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transitions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_wallets_on_account_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "coin_wallets", "coins"
  add_foreign_key "coin_wallets", "wallets"
  add_foreign_key "operations", "coins"
  add_foreign_key "operations", "wallets", column: "wallet_destination_id"
  add_foreign_key "operations", "wallets", column: "wallet_origin_id"
  add_foreign_key "transitions", "accounts"
  add_foreign_key "wallets", "accounts"
end
