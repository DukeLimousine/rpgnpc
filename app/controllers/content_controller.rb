class ContentController < ApplicationController
	def generate_name
    args = {}
    case params[:gender_selector].downcase
    when "male"
      args[:gender] = 0
    when "female"
      args[:gender] = 1
    when "neutral"
      args[:gender] = 2
    end

    args[:type] = params[:is_epic] ? 2 : 1

    args[:race] = params[:race_selector].to_i

	  @name = Name.new.generate_random_name(args[:type], args[:gender], args[:race])

      respond_to do |format|
        format.html { render :home }
        format.json { render json: @name}
      end
	end
end