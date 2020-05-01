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

ActiveRecord::Schema.define(version: 2020_04_30_100914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deposits", force: :cascade do |t|
    t.string "receipt_no"
    t.string "deposit_type"
    t.string "currency", limit: 4
    t.decimal "value", precision: 16, scale: 2
    t.string "desc"
    t.string "submitted_by"
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_deposits_on_member_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "cetya"
    t.string "phone", limit: 20
    t.decimal "total", precision: 14, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "receipt_no"
    t.string "withdraw_or_deposit"
    t.string "transaction_type"
    t.string "currency", limit: 4
    t.decimal "money_value", precision: 16, scale: 4
    t.string "desc"
    t.string "submitted_by"
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_transactions_on_member_id"
  end

  create_table "withdraws", force: :cascade do |t|
    t.string "receipt_no"
    t.string "withdrawal_type"
    t.string "currency", limit: 4
    t.decimal "value", precision: 16, scale: 2
    t.string "desc"
    t.string "submitted_by"
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_withdraws_on_member_id"
  end

  add_foreign_key "deposits", "members"
  add_foreign_key "transactions", "members"
  add_foreign_key "withdraws", "members"
end
