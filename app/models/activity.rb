class Activity < ApplicationRecord
	has_many :activity_histories

  validates :name, presence: true, uniqueness: true

	def latest_history_datetime
		activity_histories.order(acted_at: :desc).first&.acted_at
	end

	def passed_time
    return -1 if latest_history_datetime.nil?

		Time.current - latest_history_datetime
	end
end
