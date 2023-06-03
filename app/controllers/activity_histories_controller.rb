class ActivityHistoriesController < ApplicationController
  def create
    @activity_history = ActivityHistory.new(activity_history_params)
    if @activity_history.save
      redirect_to activities_path
    else
      # これでいいのかは微妙
      @activities = Activity.all
      render 'activities/index', status: :unprocessable_entity
    end
  end

  private

  def activity_history_params
    params.require(:activity_histories).permit(
      :activity_id,
      :acted_at,
      :note,
    )
  end
end
