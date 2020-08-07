class CreateSpellDescriptors < ActiveRecord::Migration[6.0]
  def change
    create_table :spell_descriptors do |t|
      t.string :descriptor
    end
  end
end
