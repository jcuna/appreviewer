class AppProfileController < ApplicationController
  def show
  	@appName = Status.find_by_appName(params[:id])
  	if @appName
end
	@statuses = Status.find_by @appName:
  	render action: :show

end
end
