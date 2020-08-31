class CreateJoinTableCharacterTemplatesFeats < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :character_templates, :feats do |t|
  		t.index :character_template_id
  		t.index :feat_id
    end
  end
end
