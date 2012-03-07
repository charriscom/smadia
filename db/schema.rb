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

ActiveRecord::Schema.define(:version => 20120307054000) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.integer  "category_id"
    t.date     "published"
    t.date     "closed"
    t.string   "title"
    t.text     "highlights"
    t.text     "summary"
    t.text     "content"
    t.boolean  "carrusel",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.date     "published"
    t.date     "closed"
    t.text     "content"
    t.string   "signature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_entries", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "city"
    t.string   "identifier"
    t.string   "email"
    t.string   "country"
    t.text     "description"
    t.string   "service"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.text     "usage"
    t.text     "response"
    t.text     "website"
    t.text     "footer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "microsite_id"
    t.integer  "promotion_id"
  end

  create_table "images", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "purpose"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microsites", :force => true do |t|
    t.string   "name"
    t.date     "published"
    t.date     "closed"
    t.text     "summary"
    t.boolean  "home_page"
    t.boolean  "section_page"
    t.boolean  "other_category"
    t.boolean  "external_page"
    t.integer  "category_id"
    t.integer  "microsite_id"
    t.text     "content"
    t.boolean  "form"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "fblike",         :default => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "user_create"
    t.boolean  "user_edit"
    t.boolean  "user_delete"
    t.boolean  "user_view"
    t.boolean  "user_export"
    t.boolean  "category_create"
    t.boolean  "category_edit"
    t.boolean  "category_delete"
    t.boolean  "category_view"
    t.boolean  "category_export"
    t.boolean  "article_create"
    t.boolean  "article_edit"
    t.boolean  "article_delete"
    t.boolean  "article_view"
    t.boolean  "article_export"
    t.boolean  "promotion_create"
    t.boolean  "promotion_edit"
    t.boolean  "promotion_delete"
    t.boolean  "promotion_view"
    t.boolean  "promotion_export"
    t.boolean  "video_create"
    t.boolean  "video_edit"
    t.boolean  "video_delete"
    t.boolean  "video_view"
    t.boolean  "video_export"
    t.boolean  "microsite_create"
    t.boolean  "microsite_edit"
    t.boolean  "microsite_delete"
    t.boolean  "microsite_view"
    t.boolean  "microsite_export"
    t.boolean  "comment_create"
    t.boolean  "comment_edit"
    t.boolean  "comment_delete"
    t.boolean  "comment_view"
    t.boolean  "comment_export"
    t.boolean  "socail_network_create"
    t.boolean  "socail_network_edit"
    t.boolean  "socail_network_delete"
    t.boolean  "socail_network_view"
    t.boolean  "socail_network_export"
    t.boolean  "form_create"
    t.boolean  "form_edit"
    t.boolean  "form_delete"
    t.boolean  "form_view"
    t.boolean  "form_export"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", :force => true do |t|
    t.integer  "category_id"
    t.decimal  "value"
    t.integer  "discount"
    t.decimal  "discount_value"
    t.date     "published"
    t.date     "closed"
    t.string   "title"
    t.text     "terms"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "pagos_online_form"
    t.string   "pagos_online_header"
    t.string   "slug"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "identifier"
    t.string   "name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.string   "login"
    t.date     "birth_date"
    t.string   "profesion"
    t.string   "position"
    t.string   "business_name"
    t.integer  "business_phone"
    t.integer  "business_phone_ext"
    t.string   "business_phone_type"
    t.integer  "phone"
    t.string   "phone_type"
    t.integer  "mobile"
    t.string   "address"
    t.string   "address_type"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "email_type"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.boolean  "home_page"
    t.string   "title"
    t.date     "published"
    t.date     "closed"
    t.string   "link"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

end
