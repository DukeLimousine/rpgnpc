class CreateJoinTableSpellSpellDescriptor < ActiveRecord::Migration[6.0]
  def change
  	create_table :spells_spell_descriptors, id: false do |t|
      t.belongs_to :spell
      t.belongs_to :spell_descriptor
    end
  end
end
