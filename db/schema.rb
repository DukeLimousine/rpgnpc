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

ActiveRecord::Schema.define(version: 2020_08_31_173729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.integer "ability_classification_id"
    t.string "name"
    t.integer "times_per_day"
    t.string "descriptor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "abilities_character_templates", id: false, force: :cascade do |t|
    t.bigint "character_template_id", null: false
    t.bigint "ability_id", null: false
    t.index ["ability_id"], name: "index_abilities_character_templates_on_ability_id"
    t.index ["character_template_id"], name: "index_abilities_character_templates_on_character_template_id"
  end

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

  create_table "character_templates", force: :cascade do |t|
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
    t.integer "race_id"
    t.integer "class_id"
    t.integer "level"
    t.integer "size_id"
    t.integer "hit_dice"
    t.integer "hit_points"
    t.integer "creature_classification_id"
    t.integer "initiative"
    t.string "speed"
    t.integer "armor_class"
    t.integer "touch_ac"
    t.integer "flat_footed_ac"
    t.string "ac_types"
    t.string "base_attack_bonus"
    t.integer "grapple"
    t.string "full_attack_melee"
    t.string "full_attack_ranged"
    t.string "melee_damage"
    t.string "ranged_damage"
    t.integer "fortitude"
    t.integer "reflex"
    t.integer "will"
    t.string "skills"
    t.string "spells_known"
    t.string "spells_per_day"
    t.integer "excess_gp"
    t.integer "familiar_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "character_templates_feats", id: false, force: :cascade do |t|
    t.bigint "character_template_id", null: false
    t.bigint "feat_id", null: false
    t.index ["character_template_id"], name: "index_character_templates_feats_on_character_template_id"
    t.index ["feat_id"], name: "index_character_templates_feats_on_feat_id"
  end

  create_table "creature_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "familiars", force: :cascade do |t|
    t.string "typenames"
    t.integer "character_template_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feats", force: :cascade do |t|
    t.string "name"
    t.integer "times_per_day"
    t.string "descriptor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.integer "item_classification_id"
    t.boolean "magic"
    t.boolean "repeatable"
    t.integer "charges"
    t.integer "times_per_day"
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "name_classifications", force: :cascade do |t|
    t.string "classification"
  end

  create_table "name_positions", force: :cascade do |t|
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "names", force: :cascade do |t|
    t.integer "name_classification_id"
    t.string "name"
    t.integer "race_id"
    t.boolean "epic"
    t.integer "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "name_position_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
  end

  create_table "spell_descriptors", force: :cascade do |t|
    t.string "descriptor"
  end

  create_table "spell_descriptors_spells", id: false, force: :cascade do |t|
    t.bigint "spell_descriptor_id", null: false
    t.bigint "spell_id", null: false
    t.index ["spell_descriptor_id"], name: "index_spell_descriptors_spells_on_spell_descriptor_id"
    t.index ["spell_id"], name: "index_spell_descriptors_spells_on_spell_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "list"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "traits", force: :cascade do |t|
    t.string "trait"
  end

end
