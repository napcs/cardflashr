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

ActiveRecord::Schema.define(version: 20160229023315) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.text     "question_text"
    t.text     "answer_text"
    t.integer  "deck_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "background_color",            default: "#333333"
    t.string   "foreground_color",            default: "#FFFFFF"
    t.string   "font_size",                   default: "16pt"
    t.string   "font",                        default: "Arial"
    t.string   "question_image_file_name"
    t.string   "question_image_content_type"
    t.integer  "question_image_file_size"
    t.datetime "question_image_updated_at"
  end

  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "category_id"
    t.string   "background_color", default: "#333333"
    t.string   "foreground_color", default: "#FFFFFF"
    t.string   "font_size",        default: "16pt"
    t.string   "font",             default: "Arial"
    t.string   "slug"
    t.datetime "published_at"
  end

  add_index "decks", ["category_id"], name: "index_decks_on_category_id"
  add_index "decks", ["user_id"], name: "index_decks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
