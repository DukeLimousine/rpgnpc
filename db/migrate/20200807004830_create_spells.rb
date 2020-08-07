class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.string :list
      t.integer :priority

      t.timestamps
    end
  end
end
