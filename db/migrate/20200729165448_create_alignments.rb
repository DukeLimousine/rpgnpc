class CreateAlignments < ActiveRecord::Migration[6.0]
  def change
    create_table :alignments do |t|
      t.string :law_axis
      t.string :good_axis
    end
  end
end
