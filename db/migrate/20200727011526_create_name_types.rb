class CreateNameTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :name_types do |t|
      t.string :type
    end
  end
end
