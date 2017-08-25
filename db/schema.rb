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

ActiveRecord::Schema.define(version: 20170825015344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
    t.integer "scoreboard_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_games_on_comment_id"
    t.index ["game_id"], name: "index_games_on_game_id"
  end

  create_table "scoreboards", force: :cascade do |t|
    t.integer "week"
    t.string "away_team"
    t.string "home_team"
    t.integer "away_points"
    t.integer "home_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports_test_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week"
    t.string "away_team"
    t.string "home_team"
    t.integer "away_points"
    t.integer "home_points"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team_name"
    t.string "stadium"
    t.string "wins_losses"
    t.integer "titles"
    t.string "rival"
    t.string "logo"
    t.string "abbr"
    t.index ["team_id"], name: "index_teams_on_team_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "username"
    t.string "password"
    t.string "team_id"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "games", "comments"
  add_foreign_key "games", "games"
  add_foreign_key "teams", "teams"
  add_foreign_key "teams", "users"
end
