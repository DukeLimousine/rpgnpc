class CreateCreatureClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :creature_classifications do |t|
      t.string :classification
    end
  end
end
