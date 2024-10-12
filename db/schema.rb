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

ActiveRecord::Schema[7.1].define(version: 2024_10_12_080446) do
  create_table "announcements", force: :cascade do |t|
    t.string "subject"
    t.text "content"
    t.integer "club_id"
    t.integer "sig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_announcements_on_club_id"
    t.index ["sig_id"], name: "index_announcements_on_sig_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "convener_id"
    t.boolean "exclusive", default: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "round", default: 1
    t.boolean "moving_forward", default: true
    t.integer "sig_id"
    t.index ["club_id"], name: "index_registrations_on_club_id"
    t.index ["user_id", "club_id", "sig_id"], name: "index_registrations_on_user_id_and_club_id_and_sig_id", unique: true
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "round_name"
    t.string "round_type"
    t.date "start_date"
    t.date "end_date"
    t.string "venue"
    t.string "link"
    t.integer "club_id"
    t.integer "sig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round_number"
    t.integer "schedule_id"
    t.index ["club_id"], name: "index_rounds_on_club_id"
    t.index ["sig_id"], name: "index_rounds_on_sig_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sig_id"
    t.string "name"
    t.integer "club_id"
    t.index ["club_id"], name: "index_schedules_on_club_id"
    t.index ["sig_id"], name: "index_schedules_on_sig_id"
  end

  create_table "sigs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_sigs_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announcements", "clubs"
  add_foreign_key "announcements", "sigs"
  add_foreign_key "registrations", "clubs"
  add_foreign_key "registrations", "users"
  add_foreign_key "rounds", "clubs"
  add_foreign_key "rounds", "sigs"
  add_foreign_key "schedules", "sigs"
  add_foreign_key "sigs", "clubs"
end
