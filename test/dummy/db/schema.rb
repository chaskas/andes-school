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

ActiveRecord::Schema[7.1].define(version: 2025_06_27_000001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "school_facilitators", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
  end

  create_table "school_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_groups_participants", id: false, force: :cascade do |t|
    t.bigint "school_group_id", null: false
    t.bigint "school_participant_id", null: false
    t.index ["school_group_id"], name: "index_school_groups_participants_on_school_group_id"
    t.index ["school_participant_id"], name: "index_school_groups_participants_on_school_participant_id"
  end

  create_table "school_participants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "birthday"
  end

  create_table "school_session_details", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "targetable_type"
    t.bigint "targetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["targetable_type", "targetable_id"], name: "index_school_session_details_on_targetable"
  end

  create_table "school_session_records", force: :cascade do |t|
    t.bigint "session_detail_id", null: false
    t.datetime "start_time", null: false
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_detail_id"], name: "index_school_session_records_on_session_detail_id"
  end

  create_table "school_students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "school_groups_participants", "school_groups"
  add_foreign_key "school_groups_participants", "school_participants"
  add_foreign_key "school_session_records", "school_session_details", column: "session_detail_id"
end
