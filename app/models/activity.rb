class Activity < ApplicationRecord
  belongs_to :user
  has_many :activity_histories

  validates :name, presence: true, uniqueness: { scope: :user_id }

  def latest_history_datetime
    activity_histories.order(acted_at: :desc).first&.acted_at
  end

  def passed_time
    return -1 if latest_history_datetime.nil?

    Time.current - latest_history_datetime
  end

  class << self
    def all_for(user)
      Activity.where(user: user)
    end
  end
end
