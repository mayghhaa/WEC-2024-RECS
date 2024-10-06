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

ActiveRecord::Schema[7.1].define(version: 2024_10_06_192702) do
  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "club_id", null: false
    t.date "pre_recruitment_talk_date"
    t.string "pre_recruitment_talk_venue"
    t.boolean "tasks_applicable"
    t.date "tasks_due_date"
    t.boolean "oa_applicable"
    t.date "oa_date"
    t.date "interview_start_date"
    t.date "interview_end_date"
    t.string "interview_venue"
    t.date "result_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_schedules_on_club_id"
  end

  add_foreign_key "schedules", "clubs"
end
