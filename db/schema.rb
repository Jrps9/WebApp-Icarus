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

ActiveRecord::Schema.define(version: 2022_03_23_152224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "debts", force: :cascade do |t|
    t.integer "amount"
    t.bigint "spent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "paid_1", default: false
    t.boolean "paid_2", default: false
    t.boolean "paid_3", default: false
    t.index ["spent_id"], name: "index_debts_on_spent_id"
  end

  create_table "debts_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "debt_id", null: false
    t.index ["debt_id", "user_id"], name: "index_debts_users_on_debt_id_and_user_id"
    t.index ["user_id", "debt_id"], name: "index_debts_users_on_user_id_and_debt_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "name"
    t.string "destination"
    t.text "description"
    t.datetime "start_day"
    t.datetime "end_day"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "spents", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "white_spent", null: false
    t.integer "black_spent"
    t.bigint "user_id"
    t.string "name", null: false
    t.text "description"
    t.string "participants", array: true
    t.index ["user_id"], name: "index_spents_on_user_id"
  end

  create_table "spents_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spent_id", null: false
    t.index ["spent_id", "user_id"], name: "index_spents_users_on_spent_id_and_user_id"
    t.index ["user_id", "spent_id"], name: "index_spents_users_on_user_id_and_spent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "portrait"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_works", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "work_id", null: false
    t.index ["user_id", "work_id"], name: "index_users_works_on_user_id_and_work_id"
    t.index ["work_id", "user_id"], name: "index_users_works_on_work_id_and_user_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "name"
    t.string "participants", array: true
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "debts", "spents"
  add_foreign_key "reservations", "users"
  add_foreign_key "works", "users"
end
