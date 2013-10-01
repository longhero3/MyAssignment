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

ActiveRecord::Schema.define(:version => 20131001030410) do

  create_table "book_categories", :force => true do |t|
    t.integer  "book_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.string   "publisher"
    t.string   "published_date"
    t.decimal  "price"
    t.string   "img_url"
    t.integer  "total_rating_value"
    t.integer  "rating_count"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "rating"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "book_id"
    t.date     "comment_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "order_lines", :force => true do |t|
    t.integer  "order_id"
    t.integer  "book_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cart_id"
  end

  create_table "orders", :force => true do |t|
    t.date     "date"
    t.integer  "total_amount"
    t.integer  "user_id"
    t.string   "shipping_address"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "full_name"
    t.date     "birthday"
    t.date     "create_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
