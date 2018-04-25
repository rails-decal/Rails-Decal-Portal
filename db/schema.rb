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

ActiveRecord::Schema.define(version: 20180418235239) do

  create_table "admins", force: :cascade do |t|
    t.boolean "active"
    t.string "email"
    t.string "name"
    t.string "office_hours"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.datetime "due_date"
    t.text "description"
    t.string "link"
    t.integer "week_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_assignments_on_week_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "status"
    t.text "comment"
    t.integer "week_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
    t.index ["week_id"], name: "index_attendances_on_week_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.text "description"
    t.integer "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_resources_on_week_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "title"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_submissions", force: :cascade do |t|
    t.integer "student_id"
    t.integer "submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_submissions_on_student_id"
    t.index ["submission_id"], name: "index_student_submissions_on_submission_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "picture"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["semester_id"], name: "index_students_on_semester_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "score"
    t.datetime "date"
    t.boolean "graded"
    t.text "comment"
    t.integer "assignment_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.index ["admin_id"], name: "index_submissions_on_admin_id"
    t.index ["assignment_id"], name: "index_submissions_on_assignment_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.text "description"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week_number"
    t.index ["semester_id"], name: "index_weeks_on_semester_id"
  end

end
