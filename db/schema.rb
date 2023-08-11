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

ActiveRecord::Schema[7.0].define(version: 2023_08_11_012115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_service", id: false, force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.bigint "service_id", null: false
    t.index ["bill_id", "service_id"], name: "index_bill_service_on_bill_id_and_service_id", unique: true
    t.index ["bill_id"], name: "index_bill_service_on_bill_id"
    t.index ["service_id"], name: "index_bill_service_on_service_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_bills_on_author_id"
  end

  create_table "bills_services", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.bigint "service_id", null: false
    t.index ["bill_id", "service_id"], name: "index_bills_services_on_bill_id_and_service_id", unique: true
    t.index ["bill_id"], name: "index_bills_services_on_bill_id"
    t.index ["service_id"], name: "index_bills_services_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_services_on_author_id"
  end

  create_table "services_bills", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "bill_id", null: false
    t.index ["bill_id"], name: "index_services_bills_on_bill_id"
    t.index ["service_id", "bill_id"], name: "index_services_bills_on_service_id_and_bill_id", unique: true
    t.index ["service_id"], name: "index_services_bills_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bill_service", "bills"
  add_foreign_key "bill_service", "services"
  add_foreign_key "bills", "users", column: "author_id"
  add_foreign_key "bills_services", "bills"
  add_foreign_key "bills_services", "services"
  add_foreign_key "services", "users", column: "author_id"
  add_foreign_key "services_bills", "bills"
  add_foreign_key "services_bills", "services"
end
