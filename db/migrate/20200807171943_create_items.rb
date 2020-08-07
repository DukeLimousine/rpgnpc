class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :priority
      t.integer :item_classification_id
      t.boolean :magic
      t.boolean :repeatable
      t.integer :charges
      t.integer :times_per_day
      t.integer :cost

      t.timestamps
    end
  end
end
