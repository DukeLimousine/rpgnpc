class Name < ApplicationRecord
	belongs_to :name_classification, :foreign_key => "name_classification_id"
	belongs_to :race, :foreign_key => "race_id"
end
