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

ActiveRecord::Schema.define(version: 2020_08_06_195526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "alignments", force: :cascade do |t|
    t.string "law_axis"
    t.string "good_axis"
  end

  create_table "char_classes", force: :cascade do |t|
    t.string "name"
  end

  create_table "creature_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "item_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "name_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "names", force: :cascade do |t|
    t.integer "name_classification_id"
    t.string "name"
    t.integer "race_id"
    t.boolean "epic"
    t.integer "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
  end

end
