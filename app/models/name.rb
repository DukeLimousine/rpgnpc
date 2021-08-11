# #Types:
# 1: normal
# 2: epic
# 3: mount
# 4: gnomish_nickname

# TODO: make this an actual table
# Gender:
# 0: male
# 1: female
# 2: neutral

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

  def generate_random_name(type, gender, race)
  	@random_name = ""
  	race = race.to_i
  	type = type.to_i
  	gender = gender.to_i
  	if race == 5 #if half-elf, set to either human or elf randomly
  	  race = rand(100) < 51 ? 1 : 3
  	end
  	case type
  	when 1 #normal
  	  @random_name = generate_normal_name(gender, race)
	when 2 #epic
	  @random_name = generate_epic_name(gender, race)
	when 3 #mount
		@random_name = gender == 2 ? Name.where(name_classification_id: 3).sample.name.capitalize : Name.where(name_classification_id: 3, gender: [gender,2]).sample.name.capitalize
	else
		puts "Error in Name.generate_random_name - invalid argument"
		@random_name = "Pat Bones"
	end

	@random_name
  end

  private
 
  def get_first_last(gender, race)
  	first_last = [] #first name in 0, last name in 1
  	
  	# Get random first name matching gender and race. Same gender rules as above
  	first_name = gender == 2 ? Name.where(name_position_id: 1, race_id: race).sample.name.capitalize :  Name.where(name_position_id: 1, race_id: race, gender: [gender, 2]).sample.name.capitalize
  	first_last << first_name
  	unless race == 6 #If half-orc, only 1 name
  		# Get random last name matching race. We don't worry about gender for last names
  		first_last << Name.where(name_position_id: 2, race_id: race).sample.name.capitalize
  	end
  	first_last
  end

  def generate_normal_name(gender,race)
  	first_and_last_name = get_first_last(gender, race)
	if race == 4 #gnomes get a nickname
	  nickname = Name.where(name_classification_id: 4).sample.name.capitalize
	  normal_name = first_and_last_name[0] + " \"" + nickname + "\" " + first_and_last_name[1]
	else 
	  normal_name = first_and_last_name[0]
	  normal_name = first_and_last_name.size > 1 ? normal_name + " " + first_and_last_name[1] : normal_name
	end
	normal_name
  end

  def generate_epic_name(gender, race)
  	normal_name = generate_normal_name(gender, race)
	# if gender is neutral (2) retrieve any name that matches position. Otherwise, get name of the matching gender or a neutral gender name (2)
	pre_title = gender == 2 ? Name.where(name_position_id: 3).sample.name : Name.where(name_position_id: 3, gender: [gender, 2]).sample.name
	if pre_title.include? "X_"
		# We probably don't need to worry about gender for pre-pre-titles
		pre_title = pre_title.gsub(/X_/, Name.where(name_position_id: 4).sample.name)
	end
	pre_title = pre_title.capitalize
	epic_name = pre_title + " " + normal_name
	   if rand(100) < 51 #roll 50% chance for post title
	    post_title = gender == 2 ? Name.where(name_position_id: 6).sample.name : Name.where(name_position_id: 6, gender: [gender, 2]).sample.name
	    if post_title.include? "X_num"
	    	post_title = post_title.gsub(/X_num/, rand(100).to_s)
	    end
	    if post_title.include? "X_place"
	    	post_title = post_title.gsub(/X_place/, Place.all.sample.name)
	    end
	    epic_name = epic_name + ", " + post_title.titleize
	end
	epic_name
  end

end
