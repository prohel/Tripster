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

ActiveRecord::Schema.define(version: 20141207203855) do

  create_table "album_comments", force: true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_comments", ["album_id"], name: "index_album_comments_on_album_id"
  add_index "album_comments", ["user_id"], name: "index_album_comments_on_user_id"

  create_table "album_ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "score"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_ratings", ["album_id"], name: "index_album_ratings_on_album_id"
  add_index "album_ratings", ["user_id"], name: "index_album_ratings_on_user_id"

  create_table "albums", force: true do |t|
    t.integer  "trip_id"
    t.string   "name"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["created_by_id"], name: "index_albums_on_created_by_id"
  add_index "albums", ["trip_id"], name: "index_albums_on_trip_id"

  create_table "attachment_comments", force: true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.integer  "attachment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachment_comments", ["attachment_id"], name: "index_attachment_comments_on_attachment_id"
  add_index "attachment_comments", ["user_id"], name: "index_attachment_comments_on_user_id"

  create_table "attachment_ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "score"
    t.integer  "attachment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachment_ratings", ["attachment_id"], name: "index_attachment_ratings_on_attachment_id"
  add_index "attachment_ratings", ["user_id"], name: "index_attachment_ratings_on_user_id"

  create_table "attachments", force: true do |t|
    t.string   "names"
    t.string   "type"
    t.integer  "trip_id"
    t.integer  "album_id"
    t.integer  "created_by_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
  end

  add_index "attachments", ["album_id"], name: "index_attachments_on_album_id"
  add_index "attachments", ["created_by_id"], name: "index_attachments_on_created_by_id"
  add_index "attachments", ["trip_id"], name: "index_attachments_on_trip_id"

  create_table "follows", force: true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "friendships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user1_id"
    t.integer  "user2_id"
  end

  add_index "friendships", ["user1_id"], name: "index_friendships_on_user1_id"
  add_index "friendships", ["user2_id"], name: "index_friendships_on_user2_id"

  create_table "likes", force: true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "location_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentions", force: true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions"

  create_table "trip_invites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_email"
    t.string   "receiver_email"
    t.integer  "accepted"
    t.integer  "trip_id"
  end

  add_index "trip_invites", ["trip_id"], name: "index_trip_invites_on_trip_id"

  create_table "trips", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "created_by"
  end

  create_table "user_locations", force: true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_locations", ["location_id"], name: "index_user_locations_on_location_id"
  add_index "user_locations", ["user_id"], name: "index_user_locations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
