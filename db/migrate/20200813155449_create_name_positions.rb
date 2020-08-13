class CreateNamePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :name_positions do |t|
      t.string :position

      t.timestamps
    end
  end
end
