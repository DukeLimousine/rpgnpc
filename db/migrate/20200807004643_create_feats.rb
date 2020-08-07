class CreateFeats < ActiveRecord::Migration[6.0]
  def change
    create_table :feats do |t|
      t.string :name
      t.integer :times_per_day
      t.string :descriptor

      t.timestamps
    end
  end
end
