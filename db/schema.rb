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

ActiveRecord::Schema.define(version: 20160616122706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string   "preambula"
    t.string   "name"
    t.string   "state"
    t.string   "city"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "acts", ["user_id"], name: "index_acts_on_user_id", using: :btree

  create_table "amandman", force: :cascade do |t|
    t.date     "date"
    t.string   "type"
    t.text     "content"
    t.integer  "clause_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "amandman", ["clause_id"], name: "index_amandman_on_clause_id", using: :btree
  add_index "amandman", ["user_id"], name: "index_amandman_on_user_id", using: :btree

  create_table "amandments", force: :cascade do |t|
    t.date     "date"
    t.string   "type"
    t.text     "content"
    t.text     "explanation"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
  end

  add_index "amandments", ["owner_type", "owner_id"], name: "index_amandments_on_owner_type_and_owner_id", using: :btree

  create_table "clauses", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clauses", ["subject_id"], name: "index_clauses_on_subject_id", using: :btree

  create_table "dots", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "stance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dots", ["stance_id"], name: "index_dots_on_stance_id", using: :btree

  create_table "heads", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "act_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "heads", ["act_id"], name: "index_heads_on_act_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "subdot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paragraphs", ["subdot_id"], name: "index_paragraphs_on_subdot_id", using: :btree

  create_table "regulations", force: :cascade do |t|
    t.string   "name"
    t.text     "definition"
    t.integer  "head_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "regulations", ["head_id"], name: "index_regulations_on_head_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "stances", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "clause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stances", ["clause_id"], name: "index_stances_on_clause_id", using: :btree

  create_table "subdots", force: :cascade do |t|
    t.text     "content"
    t.string   "name"
    t.integer  "dot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subdots", ["dot_id"], name: "index_subdots_on_dot_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "regulation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "subjects", ["regulation_id"], name: "index_subjects_on_regulation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
