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

ActiveRecord::Schema.define(:version => 20120516135312) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.string   "view_token"
    t.string   "edit_token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drink_types", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drinks", :force => true do |t|
    t.string   "name"
    t.integer  "drink_type_id"
    t.integer  "sugar_type_id"
    t.integer  "sugar_amount_id"
    t.integer  "milk_type_id"
    t.integer  "milk_amount_id"
    t.integer  "strength_id"
    t.integer  "variation_id"
    t.string   "note"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "company_id"
  end

  add_index "drinks", ["drink_type_id"], :name => "index_drinks_on_drink_type_id"
  add_index "drinks", ["milk_amount_id"], :name => "index_drinks_on_milk_amount_id"
  add_index "drinks", ["milk_type_id"], :name => "index_drinks_on_milk_type_id"
  add_index "drinks", ["strength_id"], :name => "index_drinks_on_strength_id"
  add_index "drinks", ["sugar_amount_id"], :name => "index_drinks_on_sugar_amount_id"
  add_index "drinks", ["sugar_type_id"], :name => "index_drinks_on_sugar_type_id"
  add_index "drinks", ["variation_id"], :name => "index_drinks_on_variation_id"

  create_table "milk_amounts", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "milk_types", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "strengths", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sugar_amounts", :force => true do |t|
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sugar_types", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "uid"
    t.string   "nickname"
    t.string   "company_name"
    t.string   "image"
    t.string   "token"
  end

  create_table "variations", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
