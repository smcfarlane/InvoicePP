# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150518191233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_invoices", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.decimal  "total",      precision: 10, scale: 2
    t.boolean  "flat_fee"
    t.boolean  "paid"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.date     "due_date"
    t.string   "identifier"
    t.boolean  "active"
  end

  create_table "clients", force: :cascade do |t|
    t.boolean  "active"
    t.integer  "manager_id"
    t.integer  "user_id"
    t.integer  "detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "email"
    t.string   "phone_number"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "title"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.string   "item"
    t.decimal  "value",             precision: 10, scale: 2
    t.integer  "client_invoice_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "manager_invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.integer  "detail_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", id: false, force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "vendor_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "identifier"
    t.integer  "client_id"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.integer  "user_id"
    t.integer  "ref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendor_invoices", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "project_id"
    t.decimal  "total",      precision: 10, scale: 2
    t.boolean  "flat_fee"
    t.boolean  "entered"
    t.boolean  "paid"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "vendor_line_items", force: :cascade do |t|
    t.string   "item"
    t.decimal  "value",              precision: 10, scale: 2
    t.integer  "vendor_invoices_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.integer  "detail_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "created_by"
    t.boolean  "active"
  end

end
