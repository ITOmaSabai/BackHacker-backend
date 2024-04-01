# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_01_104814) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "administrative_area_level_1"
    t.string "formatted_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "spots_id", null: false
    t.index ["spots_id"], name: "index_addresses_on_spots_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.bigint "spots_id", null: false
    t.index ["spots_id"], name: "index_comments_on_spots_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.bigint "spots_id", null: false
    t.index ["spots_id"], name: "index_likes_on_spots_id"
    t.index ["users_id"], name: "index_likes_on_users_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "lat"
    t.float "lng"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_spots_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_video_id"
    t.string "thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "spots_id", null: false
    t.index ["spots_id"], name: "index_videos_on_spots_id"
  end

  add_foreign_key "addresses", "spots", column: "spots_id"
  add_foreign_key "comments", "spots", column: "spots_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "likes", "spots", column: "spots_id"
  add_foreign_key "likes", "users", column: "users_id"
  add_foreign_key "spots", "users", column: "users_id"
  add_foreign_key "videos", "spots", column: "spots_id"
end
