class Ability < ApplicationRecord
	belongs_to :ability_classification, :foreign_key => "ability_classification_id"
end
