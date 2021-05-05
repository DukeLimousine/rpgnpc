require 'csv'

module ApplicationHelper
  def parse_csv(filepath, modelname)
  	csv_text = File.read(filepath)
  	csv = CSV.parse(csv_text, :headers => true)

  	case modelname
  		when 'name'
		  	csv.each do |row|
		  		puts row
		  	end
  	else
  		puts 'options are: name'
  	end
  end
end
