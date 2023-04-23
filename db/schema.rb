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

ActiveRecord::Schema[7.0].define(version: 2023_04_23_093811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "name"
    t.bigint "maker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maker_id"], name: "index_accessories_on_maker_id"
  end

  create_table "editors", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engine_types", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "class_no"
    t.string "name"
    t.bigint "operator_id"
    t.bigint "engine_type_id"
    t.integer "alternate_for"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["engine_type_id"], name: "index_engines_on_engine_type_id"
    t.index ["operator_id"], name: "index_engines_on_operator_id"
  end

  create_table "literatures", force: :cascade do |t|
    t.text "title"
    t.string "year"
    t.bigint "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["editor_id"], name: "index_literatures_on_editor_id"
  end

  create_table "makers", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.text "location"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurrences", force: :cascade do |t|
    t.bigint "engine_id"
    t.string "series"
    t.string "name"
    t.bigint "literature_id", null: false
    t.string "volume"
    t.string "number"
    t.string "year"
    t.string "page"
    t.bigint "view_id"
    t.bigint "quality_id"
    t.string "date"
    t.text "location"
    t.integer "tender"
    t.string "tender_series"
    t.integer "detail"
    t.bigint "user_id"
    t.bigint "operator_id"
    t.bigint "maker_id"
    t.boolean "private"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["engine_id"], name: "index_occurrences_on_engine_id"
    t.index ["literature_id"], name: "index_occurrences_on_literature_id"
    t.index ["maker_id"], name: "index_occurrences_on_maker_id"
    t.index ["operator_id"], name: "index_occurrences_on_operator_id"
    t.index ["quality_id"], name: "index_occurrences_on_quality_id"
    t.index ["user_id"], name: "index_occurrences_on_user_id"
    t.index ["view_id"], name: "index_occurrences_on_view_id"
  end

  create_table "operators", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualities", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "fullname"
    t.string "password_digest"
    t.boolean "admin"
    t.text "note"
    t.boolean "prefer_private"
    t.string "pref_lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accessories", "makers"
  add_foreign_key "engines", "engine_types"
  add_foreign_key "engines", "operators"
  add_foreign_key "literatures", "editors"
  add_foreign_key "occurrences", "engines"
  add_foreign_key "occurrences", "literatures"
  add_foreign_key "occurrences", "makers"
  add_foreign_key "occurrences", "operators"
  add_foreign_key "occurrences", "qualities"
  add_foreign_key "occurrences", "users"
  add_foreign_key "occurrences", "views"
end
