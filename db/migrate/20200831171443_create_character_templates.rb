class CreateCharacterTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :character_templates do |t|
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
      t.integer :race_id
      t.integer :class_id
      t.integer :level
      t.integer :size_id
      t.integer :hit_dice
      t.integer :hit_points
      t.integer :creature_classification_id
      t.integer :initiative
      t.string :speed
      t.integer :armor_class
      t.integer :touch_ac
      t.integer :flat_footed_ac
      t.string :ac_types
      t.string :base_attack_bonus
      t.integer :grapple
      t.string :full_attack_melee
      t.string :full_attack_ranged
      t.string :melee_damage
      t.string :ranged_damage
      t.integer :fortitude
      t.integer :reflex
      t.integer :will
      t.string :skills
      t.string :spells_known
      t.string :spells_per_day
      t.integer :excess_gp
      t.integer :familiar_id

      t.timestamps
    end
  end
end
