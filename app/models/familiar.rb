class Familiar < ApplicationRecord
	belongs_to :character_template, :foreign_key => "character_template_id"
end
