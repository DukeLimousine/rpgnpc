class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.integer :ability_classification_id
      t.string :name
      t.integer :times_per_day
      t.string :descriptor

      t.timestamps
    end
  end
end
