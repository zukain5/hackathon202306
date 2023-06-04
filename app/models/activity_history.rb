class ActivityHistory < ApplicationRecord
  belongs_to :activity

  def user_id
    activity.user_id
  end
end
