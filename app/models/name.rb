class Name < ApplicationRecord
	belongs_to :name_classification, :foreign_key => "name_classification_id"
	belongs_to :race, :foreign_key => "race_id"
	belongs_to :name_position, :foreign_key => "name_position_id"

  def self.generate_random_name
	@random_name = Name.where(name_position_id: 1).sample.name.capitalize + ' ' + Name.where(name_position_id: 2).sample.name.capitalize
  end

end
