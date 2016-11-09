ActiveRecord::Schema.define(version: 20161014191847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjusters", force: :cascade do |t|
    t.string   "name"
    t.string   "agency"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "title"
    t.string   "office"
    t.string   "address"
    t.string   "type"
    t.string   "status"
    t.datetime "appointment_time"
    t.integer  "patient_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
  end

  create_table "attorneys", force: :cascade do |t|
    t.string   "name"
    t.string   "firm"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "ssn"
    t.string   "dob"
    t.string   "employer"
    t.string   "claim_number"
    t.string   "panel_number"
    t.string   "wcab_number"
    t.string   "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
