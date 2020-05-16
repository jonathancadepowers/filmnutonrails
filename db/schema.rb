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

ActiveRecord::Schema.define(version: 2020_05_16_134547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.text "name"
    t.text "record_type"
    t.bigint "record_id"
    t.bigint "blob_id"
    t.datetime "created_at"
    t.index ["blob_id"], name: "idx_16716_index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "idx_16716_index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.text "key"
    t.text "filename"
    t.text "content_type"
    t.text "metadata"
    t.bigint "byte_size"
    t.text "checksum"
    t.datetime "created_at"
    t.index ["key"], name: "idx_16707_index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_postgresql_files", force: :cascade do |t|
    t.oid "oid"
    t.string "key"
    t.index ["key"], name: "index_active_storage_postgresql_files_on_key", unique: true
  end

  create_table "artifacts", id: :bigint, default: -> { "nextval('artifacts_id_sq'::regclass)" }, force: :cascade do |t|
    t.text "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", id: :bigint, default: nil, force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", id: :bigint, default: -> { "nextval('books_id_sq'::regclass)" }, force: :cascade do |t|
    t.text "title"
    t.text "url"
    t.bigint "rating"
    t.datetime "consumed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "authors"
  end

  create_table "comments", force: :cascade do |t|
    t.text "author"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "blog_post_id"
  end

  create_table "films", id: :bigint, default: -> { "nextval('film_id_sq'::regclass)" }, force: :cascade do |t|
    t.text "title"
    t.text "url"
    t.bigint "rating"
    t.datetime "consumed_on"
    t.text "directors"
    t.bigint "release_year"
    t.float "running_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tv_shows", id: :bigint, default: -> { "nextval('shows_id_sq'::regclass)" }, force: :cascade do |t|
    t.text "title"
    t.text "url"
    t.bigint "rating"
    t.datetime "consumed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :bigint, default: nil, force: :cascade do |t|
    t.text "email", default: ""
    t.text "encrypted_password", default: ""
    t.text "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.bigint "failed_attempts", default: 0
    t.text "unlock_token"
    t.datetime "locked_at"
    t.boolean "approved", default: false
    t.boolean "pending_approval", default: true
    t.index ["approved"], name: "idx_16694_index_users_on_approved"
    t.index ["confirmation_token"], name: "idx_16694_index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "idx_16694_index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_16694_index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "idx_16694_index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id", name: "active_storage_attachments_blob_id_fkey"
end
