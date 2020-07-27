class CreateNameClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :name_classifications do |t|
      t.string :classification
    end
  end
end
