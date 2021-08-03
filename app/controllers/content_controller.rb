class ContentController < ApplicationController
	def generate_name
	  @name =  Name.new.generate_random_name

      respond_to do |format|
        format.html { render html: @name}
        format.json { render json: @name}
      end
	end
end