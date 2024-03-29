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

ActiveRecord::Schema.define(version: 20140104090722) do

  create_table "comads", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "location"
    t.string   "image_name"
    t.datetime "date_time"
    t.string   "tense"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.integer  "younger_user_id"
    t.integer  "older_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_blocks", force: true do |t|
    t.integer  "user_id"
    t.integer  "block_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_friends", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_settings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                             default: "", null: false
    t.string   "image_name",                       default: "", null: false
    t.string   "comad_id",                         default: "", null: false
    t.string   "occupation",                       default: "", null: false
    t.string   "description",                      default: "", null: false
    t.string   "organization",                     default: "", null: false
    t.integer  "uid",                    limit: 8
    t.string   "access_token"
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
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
