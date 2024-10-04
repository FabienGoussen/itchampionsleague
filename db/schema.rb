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

ActiveRecord::Schema[7.0].define(version: 2024_08_05_182534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selected"
    t.decimal "technique", precision: 5, scale: 2
    t.decimal "vista_collectif", precision: 5, scale: 2
    t.decimal "physique", precision: 5, scale: 2
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_number"
    t.index ["player_id"], name: "index_registrations_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_teams_on_player_id"
  end

  add_foreign_key "registrations", "players"
  add_foreign_key "teams", "players"
end
