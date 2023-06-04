class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @activity = Activity.new
    @activity_history = ActivityHistory.new
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

  def destroy

    @activity = Activity.find(params[:id])
    @activity.destroy

    redirect_to activities_path, status: :see_other
  end

  private

  def activity_params
    params.require(:activity).permit(
      :name
    )
  end
end
