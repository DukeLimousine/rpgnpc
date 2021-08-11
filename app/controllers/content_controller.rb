class ContentController < ApplicationController
	def generate_name
	  @name = Name.new.generate_random_name(params[:is_epic] ? 2 : 1, params[:gender_selector], params[:race_selector])

      respond_to do |format|
        format.html { render :home }
        format.json { render json: @name}
      end
	end
end