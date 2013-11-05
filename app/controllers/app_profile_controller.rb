class AppProfileController < ApplicationController
  def show
  	@appName = Status.find_by_appName(params[:id])

	  	if @appName
	  			@statuses = Status.all
	  	render action: :show
	  	else
	  		render file: 'public/404', status: 404, formats: [:html]
		end
	end
end