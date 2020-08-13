class AddNamePositionIdToNames < ActiveRecord::Migration[6.0]
  def change
    add_column :names, :name_position_id, :integer
  end
end
