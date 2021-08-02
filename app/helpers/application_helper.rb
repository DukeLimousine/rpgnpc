require 'csv'


module ApplicationHelper
  def parse_csv(filepath, modelname)
  	csv_text = File.read(filepath)
  	csv = CSV.parse(csv_text, :headers => true)

  	case modelname
  		when 'name'
		  	csv.each do |row|
		  		new_name = Name.new(row.to_hash)		  
		  		if !Name.where(name: new_name.name).first
		  			new_name.save!
		  			puts new_name.name + " Saved!"
		  		end
		  	end
  	else
  		puts 'options are: name'
  	end
  end
end
