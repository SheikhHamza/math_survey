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

ActiveRecord::Schema.define(version: 20180407182818) do

  create_table "difficulties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "low"
    t.integer "high"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "quiz_id"
    t.integer "number_one"
    t.integer "number_two"
    t.integer "number_three"
    t.integer "response"
    t.integer "solution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "qualtrics_survey_id"
    t.integer "qualtrics_response_id"
    t.time "start_time"
    t.time "end_time"
    t.bigint "difficulty_id"
    t.integer "score"
    t.integer "number_of_questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["difficulty_id"], name: "index_quizzes_on_difficulty_id"
  end

  add_foreign_key "questions", "quizzes"
end
