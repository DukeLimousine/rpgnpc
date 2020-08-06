class CreateAbilityClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :ability_classifications do |t|
      t.string :classification
    end
  end
end
