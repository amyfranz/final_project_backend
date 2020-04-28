# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_22_093000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.text "comment"
    t.datetime "created_at"
  end

  create_table "followings", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "profile_pic"
    t.integer "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "image"
    t.text "bio"
    t.integer "pet_id"
    t.datetime "posted"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "profile_pic"
    t.date "DOB"
    t.datetime "loggedin"
  end

end
