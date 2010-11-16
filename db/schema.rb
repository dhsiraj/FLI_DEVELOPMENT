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

ActiveRecord::Schema.define(:version => 20101112155257) do

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "blog_title"
    t.string   "blog_desc"
    t.string   "blog_detail"
    t.datetime "posted_on"
    t.integer  "blog_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "blog_id"
    t.integer  "user_id"
    t.string   "comment_title"
    t.string   "comment_detail"
    t.string   "ip_address"
    t.integer  "comment_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.string   "feedback_title"
    t.string   "feedback_detail"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email"
    t.string   "ip_address"
    t.string   "user_type"
    t.datetime "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
