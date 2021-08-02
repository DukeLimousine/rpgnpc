# #Types:
# 1: normal
# 2: epic
# 3: mount
# 4: gnomish_nickname

# Gender:
# 0: male
# 1: female
# 2: non-binary

# Race:
# 1: human
# 2: dwarf
# 3: elf
# 4: gnome
# 5: half-elf
# 6: half-orc
# 7: halfling
# 8: mount

# Position: 
# 1: first
# 2: last
# 3: pre-title
# 4: pre-pre-title
# 5: gnomish-nickname
# 6: post-title


class Name < ApplicationRecord
	belongs_to :name_classification, :foreign_key => "name_classification_id"
	belongs_to :race, :foreign_key => "race_id"
	belongs_to :name_position, :foreign_key => "name_position_id"

  def generate_random_name(type=1, gender=0, race=7)
  	@random_name = ""
  	case type
  	when 1 #normal
  		first_and_last_name = get_first_last(gender, race)
		@random_name = first_and_last_name[0]
		@random_name = first_and_last_name.size > 1 ? @random_name + " " + first_and_last_name[1] : @random_name
	when 2 #epic
	when 3 #mount
		@random_name = Name.where(name_classification_id: 3, gender: gender).sample.name.capitalize
	when 4 #gnomish_nickname
		first_and_last_name = get_first_last(gender, race)
	else
		puts "Error in Name.generate_random_name - invalid argument"
		@random_name = "Pat Bones"
	end

	@random_name
  end

  private
 
  def get_first_last(gender, race)
  	first_last = [] #first name in 0, last name in 1
  	
  	# Get random first name matching gender and race
  	first_last << Name.where(name_position_id: 1, race_id: race, gender: gender).sample.name.capitalize
  	unless race == 6 #If half-orc, only 1 name
  		# Get random last name matching race
  		first_last << Name.where(name_position_id: 2, race_id: race).sample.name.capitalize
  	end
  	first_last
  end

end
