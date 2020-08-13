class CreateFamiliars < ActiveRecord::Migration[6.0]
  def change
    create_table :familiars do |t|
      t.string :typenames
      t.integer :character_template_id

      t.timestamps
    end
  end
end
