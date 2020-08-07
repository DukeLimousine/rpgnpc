class CreateJoinTableSpellDescriptorsSpells < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :spell_descriptors, :spells do |t|
  		t.index :spell_descriptor_id
  		t.index :spell_id
    end
  end
end
