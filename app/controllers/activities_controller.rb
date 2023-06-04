class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :destroy]
  before_action :correct_user, only: [:show, :destroy, :edit, :update]

  def index
    if user_signed_in?
      @activities = Activity.all_for(current_user)
      @activity = Activity.new
      @activity_history = ActivityHistory.new
    end
  end

  def create
    @activity = Activity.new(activity_params)
    correct_user

    if @activity.save
      redirect_to activities_path
    else
      @activities = Activity.all_for(current_user)
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @activity ||= Activity.find(params[:id])
    @activity_history = ActivityHistory.new
  end

  def edit
    @activity ||= Activity.find(params[:id])
  end

  def update
    @activity ||= Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to @activity, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @activity ||= Activity.find(params[:id])
    @activity.destroy

    redirect_to activities_path, status: :see_other
  end

  private

  def activity_params
    params.require(:activity).permit(
      :name,
      :user_id,
    )
  end

  def correct_user
    # なんか副作用があって良くないような気もする
    @activity ||= Activity.find(params[:id])
    redirect_to(root_path) unless @activity.user == current_user
  end
end
