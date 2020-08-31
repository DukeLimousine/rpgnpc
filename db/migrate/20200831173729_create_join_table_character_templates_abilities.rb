class CreateJoinTableCharacterTemplatesAbilities < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :character_templates, :abilities do |t|
  		t.index :character_template_id
  		t.index :ability_id
    end
  end
end
