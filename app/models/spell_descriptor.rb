class SpellDescriptor < ApplicationRecord
	has_and_belongs_to_many :spells
end
