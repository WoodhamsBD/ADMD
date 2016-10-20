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

ActiveRecord::Schema.define(version: 20161014191847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjusters", force: :cascade do |t|
    t.string   "name"
    t.string   "agency"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "title"
    t.string   "office"
    t.string   "address"
    t.string   "type"
    t.string   "status"
    t.integer  "patient_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
  end

  create_table "attorneys", force: :cascade do |t|
    t.string   "name"
    t.string   "firm"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "ssn"
    t.string   "dob"
    t.string   "employer"
    t.string   "claim_number"
    t.string   "panel_number"
    t.string   "wcab_number"
    t.string   "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "remember_digest"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "activation_digest"
    t.datetime "activated_at"
    t.boolean  "activated"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "appointments", "patients"
end
