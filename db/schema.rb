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

ActiveRecord::Schema.define(:version => 20120526225413) do

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "albums", ["slug"], :name => "index_albums_on_slug"

  create_table "beaches", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "beaches", ["slug"], :name => "index_beaches_on_slug"

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "commenter"
    t.string   "comment_email"
    t.string   "comment_url"
    t.string   "ip_address_info"
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "day_trips", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "day_trips", ["slug"], :name => "index_day_trips_on_slug"

  create_table "destinations", :force => true do |t|
    t.string   "title"
    t.text     "price",            :limit => 255
    t.text     "description"
    t.integer  "destineable_id"
    t.string   "destineable_type"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "photos", :force => true do |t|
    t.integer  "album_id"
    t.string   "name"
    t.string   "caption"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "ip_address_info"
    t.datetime "published"
    t.boolean  "ban_comments"
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
  end

  create_table "safaris", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "safaris", ["slug"], :name => "index_safaris_on_slug"

  create_table "treks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "treks", ["slug"], :name => "index_treks_on_slug"

  create_table "users", :force => true do |t|
    t.string   "full_name",                           :null => false
    t.string   "slug"
    t.string   "username",                            :null => false
    t.string   "email"
    t.boolean  "admin",            :default => false, :null => false
    t.boolean  "moderator",        :default => false, :null => false
    t.text     "about"
    t.string   "ip_address_info"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
