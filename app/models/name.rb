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

  def generate_random_name(type=2, gender=0, race=4)
  	@random_name = ""
  	case type
  	when 1 #normal
  		first_and_last_name = get_first_last(gender, race)
		@random_name = first_and_last_name[0]
		@random_name = first_and_last_name.size > 1 ? @random_name + " " + first_and_last_name[1] : @random_name
	when 2 #epic
		name_type = race == 4 ? 4 : 1
		normal_name = generate_random_name(name_type, gender, race) #oops all recursion
		pre_title = Name.where(name_position_id: 3, gender: [gender, 2]).sample.name
		if pre_title.include? "X_"
			pre_title = pre_title.gsub(/X_/, Name.where(name_position_id: 4, gender: [gender,2]).sample.name)
		end
		pre_title = pre_title.capitalize
		@random_name = pre_title + " " + normal_name
	    if rand(100) < 51 #roll 50% chance for post title
	    	post_title = Name.where(name_position_id: 6, gender: [gender, 2]).sample.name
	    	if post_title.include? "X_num"
	    		post_title = post_title.gsub(/X_num/, rand(100).to_s)
	    	end
	    	if post_title.include? "X_place"
	    		post_title = post_title.gsub(/X_place/, Place.all.sample.name)
	    	end
	    	@random_name = @random_name + ", " + post_title.titleize
		end
	when 3 #mount
		@random_name = Name.where(name_classification_id: 3, gender: gender).sample.name.capitalize
	when 4 #gnomish_nickname
		first_and_last_name = get_first_last(gender, race)
		nickname = Name.where(name_classification_id: 4).sample.name.capitalize
		@random_name = first_and_last_name[0] + " \"" + nickname + "\" " + first_and_last_name[1]
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
