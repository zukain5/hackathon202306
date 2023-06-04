class ActivityHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :edit, :update]

  def create
    @activity_history = ActivityHistory.new(activity_history_params)
    correct_user

    if @activity_history.save
      redirect_to request.referer
    else
      # これでいいのかは微妙
      @activities = Activity.all_for(current_user)
      render 'activities/index', status: :unprocessable_entity
    end
  end

  def destroy
    @activity_history ||= ActivityHistory.find(params[:id])
    activity = @activity_history.activity
    @activity_history.destroy

    redirect_to activity, status: :see_other
  end

  def edit
    @activity_history ||= ActivityHistory.find(params[:id])
  end

  def update
    @activity_history ||= ActivityHistory.find(params[:id])
    if @activity_history.update(activity_history_params)
      redirect_to @activity_history.activity, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def activity_history_params
    params.require(:activity_history).permit(
      :activity_id,
      :acted_at,
      :note,
    )
  end

  def correct_user
    @activity_history ||= ActivityHistory.find(params[:id])
    redirect_to(root_path) unless @activity_history.activity.user == current_user
  end
end
