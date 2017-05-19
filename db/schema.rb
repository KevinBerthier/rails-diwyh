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

ActiveRecord::Schema.define(version: 20170519150751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date_check_in"
    t.date "date_check_out"
    t.bigint "workshop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "total_price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["workshop_id"], name: "index_bookings_on_workshop_id"
  end

  create_table "craftmen", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.text "description"
    t.date "birth_date"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_craftmen_on_email", unique: true
    t.index ["job_id"], name: "index_craftmen_on_job_id"
    t.index ["reset_password_token"], name: "index_craftmen_on_reset_password_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.bigint "universe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universe_id"], name: "index_jobs_on_universe_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "craftman_id"
    t.bigint "workshop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_type"
    t.index ["craftman_id"], name: "index_messages_on_craftman_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
    t.index ["workshop_id"], name: "index_messages_on_workshop_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "universes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workshops", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "craftman_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["craftman_id"], name: "index_workshops_on_craftman_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "workshops"
  add_foreign_key "craftmen", "jobs"
  add_foreign_key "jobs", "universes"
  add_foreign_key "messages", "craftmen"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "workshops"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "workshops", "craftmen"
end
