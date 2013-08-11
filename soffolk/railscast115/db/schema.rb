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

ActiveRecord::Schema.define(version: 20130805061526) do

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.integer  "assigned_to_id"
    t.integer  "status"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
  end

  add_index "teams_users", ["team_id"], name: "index_teams_users_on_team_id", using: :btree
  add_index "teams_users", ["user_id"], name: "index_teams_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "provider"
    t.integer  "uid"
    t.string   "github_homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
