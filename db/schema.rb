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

ActiveRecord::Schema.define(version: 2020_07_11_142928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_postgresql_files", force: :cascade do |t|
    t.oid "oid"
    t.string "key"
    t.index ["key"], name: "index_active_storage_postgresql_files_on_key", unique: true
  end

  create_table "artifacts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "recommended", default: true
    t.integer "life_log_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "url"
    t.integer "rating"
    t.datetime "consumed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authors"
    t.integer "life_log_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "author"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_post_id"
  end

  create_table "fasts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "life_log_id"
    t.string "title"
    t.decimal "time_fasted"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "rating"
    t.datetime "consumed_on"
    t.string "directors"
    t.integer "release_year"
    t.float "running_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "life_log_id"
  end

  create_table "life_logs", force: :cascade do |t|
    t.datetime "display_timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "related_object_type"
  end

  create_table "podcast_episodes", force: :cascade do |t|
    t.string "title"
    t.datetime "consumed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "life_log_id"
    t.integer "podcast_id"
    t.string "episode_title"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "runs", force: :cascade do |t|
    t.float "miles"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "run_time"
    t.integer "life_log_id"
    t.string "title"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tunes_summaries", force: :cascade do |t|
    t.datetime "summary_date"
    t.json "artists_and_tracks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "life_log_id"
    t.json "artists_and_tracks_filtered"
  end

  create_table "tv_show_seasons", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.datetime "consumed_on"
    t.integer "life_log_id"
    t.integer "tv_show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "season_title"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "approved", default: false, null: false
    t.boolean "pending_approval", default: true
    t.json "spotify_user", default: {}
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "taggings", "tags"
end
