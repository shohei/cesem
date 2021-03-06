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

ActiveRecord::Schema.define(version: 2019_07_24_094459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.integer "maintenance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.string "contact_person_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "abbreviation"
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipments", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "name_of_model"
    t.string "model_number"
    t.string "serial_number"
    t.string "inventory_number"
    t.integer "acquired_year"
    t.string "location"
    t.string "manufacturer"
    t.string "country_of_origin"
    t.string "warranty_period"
    t.integer "additional_info", default: [], array: true
    t.text "other_info"
    t.integer "dealer_id"
    t.integer "internal_number"
    t.string "remark"
    t.integer "price"
    t.text "description"
    t.integer "quantity"
    t.string "where_purchased"
    t.integer "department_id"
    t.boolean "archived", default: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "service_id"
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer "user_id"
    t.integer "equipment_id"
    t.text "description"
    t.text "precaution"
    t.string "trace_number"
    t.text "diagnosis"
    t.integer "status", default: 0
    t.date "scheduled_at"
    t.date "completion_expected_at"
    t.date "recommission_projected_at"
    t.date "completed_at"
    t.text "other_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "canceled_at"
    t.date "cancel_requested_at"
  end

  create_table "schools", force: :cascade do |t|
    t.integer "college_id"
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "billing_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "role", default: 2, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
