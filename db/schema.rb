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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130103222647) do

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "image_url"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "author"
    t.integer  "likes_count",    :default => 0
    t.text     "likes_user_ids"
    t.text     "latex_content"
    t.string   "category"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image_url"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "password_digest"
    t.string   "salt"
    t.string   "remember_token"
    t.integer  "score",           :default => 0
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
