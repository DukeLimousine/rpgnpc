class CreateItemClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :item_classifications do |t|
      t.string :classification
    end
  end
end
