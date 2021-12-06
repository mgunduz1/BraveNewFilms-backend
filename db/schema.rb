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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.bigint "genre_id"
    t.string "cast", array: true
    t.string "poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_films_on_genre_id"
  end

  create_table "followings", force: :cascade do |t|
    t.boolean "is_following", default: true
    t.bigint "user_id", null: false
    t.bigint "followable_id", null: false
    t.string "followable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "index_followings_on_followable_id_and_followable_type"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "individuals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "individual_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_characters_on_film_id"
    t.index ["individual_id"], name: "index_characters_on_individual_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
