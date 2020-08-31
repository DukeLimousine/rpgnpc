class CharacterTemplate < ApplicationRecord
	belongs_to :race, :foreign_key => "race_id"
	belongs_to :char_class, :foreign_key => "class_id"
	belongs_to :size, :foreign_key => "size_id"
	belongs_to :creature_classification, :foreign_key => "creature_classification_id"
	belongs_to :familiar, :foreign_key => "familiar_id"

end
