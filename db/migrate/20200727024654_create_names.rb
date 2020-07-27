class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.integer :name_classification_id
      t.string :name
      t.integer :race_id
      t.boolean :epic
      t.integer :gender

      t.timestamps
    end
  end
end
