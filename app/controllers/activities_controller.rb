class ActivitiesController < ApplicationController
	def index
		@activities = Activity.all
    @activity = Activity.new
	end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      @activities = Activity.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(
      :name
    )
  end
end
