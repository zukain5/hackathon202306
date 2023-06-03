class Activity < ApplicationRecord
	has_many :activity_histories
	def latest_history_datetime
		activity_histories.order(acted_at: :desc).first.acted_at
	end
end
