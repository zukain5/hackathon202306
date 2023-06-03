class ActivityHistoriesController < ApplicationController
  def create
    @activity_history = ActivityHistory.new(activity_history_params)
    if @activity_history.save
      redirect_to request.referer
    else
      # これでいいのかは微妙
      @activities = Activity.all
      render 'activities/index', status: :unprocessable_entity
    end
  end

  def destroy
    @activity_history = ActivityHistory.find(params[:id])
    activity = @activity_history.activity
    @activity_history.destroy

    redirect_to activity, status: :see_other
  end

  private

  def activity_history_params
    params.require(:activity_history).permit(
      :activity_id,
      :acted_at,
      :note,
    )
  end
end
