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

ActiveRecord::Schema[7.0].define(version: 2021_12_28_115906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", id: :string, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "reset_password_token"
    t.datetime "reset_password_token_sent_at"
    t.boolean "confirmed_by_email", default: false
    t.integer "roles", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
