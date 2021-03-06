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

ActiveRecord::Schema.define(version: 2021_09_17_142947) do

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
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer "available_spots_quantity"
    t.integer "price_per_spot_per_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_open_monday", default: true
    t.boolean "is_open_tuesday", default: true
    t.boolean "is_open_wednesday", default: true
    t.boolean "is_open_thursday", default: true
    t.boolean "is_open_friday", default: true
    t.boolean "is_open_saturday", default: false
    t.boolean "is_open_sunday", default: false
    t.bigint "coworking_id"
    t.string "week_opening_time"
    t.string "week_closing_time"
    t.string "weekend_opening_time"
    t.string "weekend_closing_time"
    t.index ["coworking_id"], name: "index_availabilities_on_coworking_id", unique: true
  end

  create_table "booking_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "coworking_rules_approved"
    t.bigint "booking_status_id"
    t.bigint "coworking_id"
    t.bigint "coworker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_status_id"], name: "index_bookings_on_booking_status_id"
    t.index ["coworker_id"], name: "index_bookings_on_coworker_id"
    t.index ["coworking_id"], name: "index_bookings_on_coworking_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "commercial_name"
    t.string "legal_name"
    t.string "legal_address"
    t.string "legal_zipcode"
    t.string "legal_city"
    t.string "legal_country"
    t.string "legal_state"
    t.string "siret"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_manager_id"
    t.index ["company_manager_id"], name: "index_companies_on_company_manager_id", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "object"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coworkings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.string "state"
    t.string "phone_number"
    t.string "email"
    t.boolean "is_operational"
    t.bigint "managing_company_id"
    t.bigint "coworking_manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_from_scrapping", default: false
    t.integer "longitude"
    t.integer "latitude"
    t.index ["coworking_manager_id"], name: "index_coworkings_on_coworking_manager_id"
    t.index ["managing_company_id"], name: "index_coworkings_on_managing_company_id"
  end

  create_table "private_set_ups", force: :cascade do |t|
    t.string "wifi_password"
    t.string "manager_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coworking_id"
    t.index ["coworking_id"], name: "index_private_set_ups_on_coworking_id", unique: true
  end

  create_table "public_set_up_accesses", force: :cascade do |t|
    t.string "set_up_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_set_ups", force: :cascade do |t|
    t.bigint "coffee_access_id"
    t.bigint "bike_storage_id"
    t.boolean "is_pet_friendly"
    t.integer "network_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coworking_id"
    t.index ["bike_storage_id"], name: "index_public_set_ups_on_bike_storage_id"
    t.index ["coffee_access_id"], name: "index_public_set_ups_on_coffee_access_id"
    t.index ["coworking_id"], name: "index_public_set_ups_on_coworking_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "birth_date"
    t.string "phone_number"
    t.string "gender"
    t.boolean "is_independent"
    t.boolean "is_validated"
    t.bigint "company_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "availabilities", "coworkings"
  add_foreign_key "bookings", "booking_statuses"
  add_foreign_key "bookings", "coworkings"
  add_foreign_key "bookings", "users", column: "coworker_id"
  add_foreign_key "companies", "users", column: "company_manager_id"
  add_foreign_key "coworkings", "companies", column: "managing_company_id"
  add_foreign_key "coworkings", "users", column: "coworking_manager_id"
  add_foreign_key "private_set_ups", "coworkings"
  add_foreign_key "public_set_ups", "coworkings"
  add_foreign_key "public_set_ups", "public_set_up_accesses", column: "bike_storage_id"
  add_foreign_key "public_set_ups", "public_set_up_accesses", column: "coffee_access_id"
  add_foreign_key "users", "companies"
end
