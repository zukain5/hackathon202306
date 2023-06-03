class ActivitiesController < ApplicationController
	def index
		@activities = Activity.all_asc_by_passed_time
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

  def show
    @activity = Activity.find(params[:id])
    @activity_history = ActivityHistory.new
  end

  private

  def activity_params
    params.require(:activity).permit(
      :name
    )
  end
end
